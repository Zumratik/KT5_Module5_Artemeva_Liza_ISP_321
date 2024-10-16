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
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Page
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void LogButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder error = new StringBuilder();
            if (string.IsNullOrEmpty(PasswordBox.Password))
            {
                error.AppendLine("Введите пароль");
            } 
            if (string.IsNullOrEmpty(LoginBox.Text))
            {
                error.AppendLine("Введите логин");
            }
            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString(),"Error",MessageBoxButton.OK,MessageBoxImage.Error);
                return;
            }
            if (Data.SportEntities.GetContext().User.Any(d => d.Password == PasswordBox.Password && d.Login == LoginBox.Text))
            {
                var user = Data.SportEntities.GetContext().User.Where(d => d.Password == PasswordBox.Password && d.Login == LoginBox.Text).FirstOrDefault();
                Classes.Manager.MainFrame.Navigate(new Pages.ListMain(user.Login.ToString()));
                MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
