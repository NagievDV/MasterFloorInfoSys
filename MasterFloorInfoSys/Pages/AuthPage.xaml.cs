using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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

namespace MasterFloorInfoSys.Pages
{
    /// <summary>
    /// Interaction logic for AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(tbLogin.Text) || string.IsNullOrEmpty(pbPassword.Password))
            {
                MessageBox.Show("Пожалуйста, введите логин и пароль.");
                return;
            }

            using (var db = new Entities())
            {
                var user = db.Manager
                    .AsNoTracking()
                    .FirstOrDefault(u => u.Login == tbLogin.Text && u.Password == pbPassword.Password);
                if (user == null)
                {
                    MessageBox.Show("Менеджер с такими данными не найден!");
                    return;
                }
                else
                {
                    MessageBox.Show("Добро пожаловать!");
                    NavigationService.Navigate(new ManagerPage());
                }
            }
        }
    }
}
