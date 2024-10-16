using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SportInventory.Pages
{
    /// <summary>
    /// Логика взаимодействия для Add.xaml
    /// </summary>
    public partial class Add : Page
    {
        Data.User currentUser = new Data.User();
        public static string user;
        public Add(string user2)
        {
            InitializeComponent();
            GenderComboBox.ItemsSource = Data.SportEntities.GetContext().Gender.ToList();
            RoleComboBox.ItemsSource = Data.SportEntities.GetContext().Role.ToList();
            user = user2;

        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder error = new StringBuilder();
            if (string.IsNullOrEmpty(PasswordBox2.Password))
            {
                error.AppendLine("Введите пароль");
            }
            if (string.IsNullOrEmpty(PasswordBox1.Password))
            {
                error.AppendLine("Введите подтвержление пароля");
            }
            if (PasswordBox1.Password != PasswordBox2.Password)
            {
                error.AppendLine("Пароли различаются");
            }
            if (string.IsNullOrEmpty(LoginTextBox.Text))
            {
                error.AppendLine("Введите логин");
            }
            if (LoginTextBox.Text == user)
            {
                error.AppendLine("Такой пользователь есть");
            }
            if (string.IsNullOrEmpty(SurnameTextBox.Text))
            {
                error.AppendLine("Введите фамилию");
            }
            if (string.IsNullOrEmpty(NameTextBox.Text))
            {
                error.AppendLine("Введите имя");
            }
            if (string.IsNullOrEmpty(PatronimicTextBox.Text))
            {
                error.AppendLine("Введите отчество");
            }
            if (string.IsNullOrEmpty(TelBox.Text))
            {
                error.AppendLine("Введите телефон");
            }
            if (string.IsNullOrEmpty(EmailTextBox.Text))
            {
                error.AppendLine("Введите почту");
            }
            if (string.IsNullOrEmpty(DatePic.SelectedDate.ToString()))
            {
                error.AppendLine("Введите дату рождения");
            }
            if (RoleComboBox.SelectedItem == null)
            {
                error.AppendLine("Выберите должность");
            }
            if (GenderComboBox.SelectedItem == null)
            {
                error.AppendLine("Выберите пол");
            }
            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            currentUser.DataBerth = DatePic.SelectedDate.Value.Date;
            currentUser.Email = EmailTextBox.Text;
            currentUser.Login = LoginTextBox.Text;
            currentUser.Password = PasswordBox1.Password;
            currentUser.Name = NameTextBox.Text;
            currentUser.Surname = SurnameTextBox.Text;
            currentUser.Patronimic = PatronimicTextBox.Text;
            currentUser.Telephon = TelBox.Text;
            var selectedRole = RoleComboBox.SelectedItem as Data.Role;
            var selectedeGEnder= GenderComboBox.SelectedItem as Data.Gender;
            currentUser.IdRole = selectedRole.Id;
            currentUser.IdGender = selectedeGEnder.Id;

            Data.SportEntities.GetContext().User.Add(currentUser);
            Data.SportEntities.GetContext().SaveChanges();
            MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
