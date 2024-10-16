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
    /// Логика взаимодействия для ListMain.xaml
    /// </summary>
    public partial class ListMain : Page
    {public static string user;
        public ListMain(string v)
        {
            InitializeComponent();
            List.ItemsSource = Data.SportEntities.GetContext().User.ToList();
            user = v;
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.Add(user));
        }
    }
}
