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
using System.Data.Entity;
using MasterFloorInfoSys.ViewModels;
using System.ComponentModel;

namespace MasterFloorInfoSys.Pages
{
    public partial class ManagerPage : Page
    {
        private PartnerDisplayInfo _selectedPartner;

        public ManagerPage()
        {
            InitializeComponent();
            DataContext = this;
            PartnerData = LoadPartnerData();
        }


        public List<PartnerDisplayInfo> PartnerData { get; set; }

        private List<PartnerDisplayInfo> LoadPartnerData()
        {
            return Entities.GetContext().Partner
                .Select(p => new
                {
                    p.ID,
                    p.Name,
                    p.CEOFirstName,
                    p.CEOMiddleName,
                    p.CEOLastName,
                    p.PhoneNumber,
                    p.Rating,
                    PartnerType = p.PartnerType1.Type
                })
                .ToList()
                .Select(p => new PartnerDisplayInfo
                {
                    ID = p.ID,
                    Name = p.Name,
                    CEO = $"{p.CEOFirstName} {p.CEOMiddleName} {p.CEOLastName}",
                    PhoneNumber = p.PhoneNumber,
                    Rating = (int)p.Rating,
                    PartnerType = p.PartnerType,
                    Discount = $"{GetDiscount(new Partner { ID = p.ID })}%"
                })
                .ToList();
        }

        private int GetDiscount(Partner partner)
        {
            using (var db = new Entities())
            {
                var totalSales = db.PartnerSales
                    .Where(sale => sale.Partner == partner.ID)
                    .Sum(sale => (decimal?)sale.Amount) ?? 0;

                if (totalSales < 10000) return 0;
                if (totalSales < 50000) return 5;
                if (totalSales < 300000) return 10;
                return 15;
            }
        }

        private void AddPartnerCommand_Execute(object parameter)
        {
            NavigationService.Navigate(new AddPartner(null));
        }

        private void EditPartnerCommand_Execute(object parameter)
        {
            var partnerId = (int)parameter;
            var partner = Entities.GetContext().Partner.FirstOrDefault(p => p.ID == partnerId);
            NavigationService.Navigate(new AddPartner(partner));
        }

        private void DeletePartnerCommand_Execute(object parameter)
        {
            var selectedPartner = PartnerData.FirstOrDefault(p => p.ID == (int)parameter);
            if (selectedPartner != null)
            {
                Entities.GetContext().Partner.Remove(Entities.GetContext().Partner.First(p => p.ID == selectedPartner.ID));
                Entities.GetContext().SaveChanges();
                PartnerData = LoadPartnerData();
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPartner(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedPartner = PartnersListView.SelectedItem as PartnerDisplayInfo;

            if (selectedPartner == null)
            {
                MessageBox.Show("Выберите партнера для удаления.");
                return;
            }

            try
            {
                using (var context = new Entities())
                {
                    var partnerToDelete = context.Partner.FirstOrDefault(p => p.ID == selectedPartner.ID);

                    if (partnerToDelete == null)
                    {
                        MessageBox.Show("Партнер не найден в базе данных.");
                        return;
                    }

                    context.Partner.Remove(partnerToDelete);
                    context.SaveChanges();
                }

                PartnerData = LoadPartnerData();
                PartnersListView.ItemsSource = PartnerData;
                MessageBox.Show("Партнер успешно удален.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении партнера: {ex.Message}");
            }
        }



        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedPartner = (PartnerDisplayInfo)((Button)sender).DataContext;

            if (selectedPartner != null)
            {
                var partnerToEdit = Entities.GetContext().Partner.FirstOrDefault(p => p.ID == selectedPartner.ID);
                if (partnerToEdit != null)
                {
                    NavigationService.Navigate(new AddPartner(partnerToEdit));
                }
                else
                {
                    MessageBox.Show("Не удалось найти выбранного партнера.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Выберите партнера для редактирования.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            PartnerData = LoadPartnerData();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        { 
                PartnerData = LoadPartnerData();
                PartnersListView.ItemsSource = PartnerData;


        }

        private void btnHistory_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PartnerHistoryPage());
        }
    }
}
