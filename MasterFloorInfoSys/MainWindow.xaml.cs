using MasterFloorInfoSys.Pages;
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

namespace MasterFloorInfoSys
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack) MainFrame.GoBack();
        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            if (!(e.Content is Page page)) return;
            this.Title = $"MasterFloor - {page.Title}";

            if (page is Pages.AuthPage)
            {
                btnCancel.Visibility = Visibility.Hidden;
                btnPartnersList.Visibility = Visibility.Hidden;
                btnPartnerHistory.Visibility = Visibility.Hidden;
            }
            else
            { 
                btnCancel.Visibility = Visibility.Visible;
                btnPartnersList.Visibility = Visibility.Visible;
                btnPartnerHistory.Visibility = Visibility.Visible;
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите выйти из приложения?", "Выход", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
            else
            {
                e.Cancel = true;
            }
        }

        private void btnPartnersList_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ManagerPage());
        }

        private void btnPartnerHistory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new PartnerHistoryPage());
        }
    }
}
