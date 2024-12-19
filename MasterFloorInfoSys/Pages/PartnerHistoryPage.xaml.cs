using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;
using System.Data.Entity;
using System;

namespace MasterFloorInfoSys.Pages
{
    public partial class PartnerHistoryPage : Page
    {
        private int _partnerId;

        public List<SaleInfo> SalesHistory { get; set; }
        public List<Partner> Partners { get; set; }

        public PartnerHistoryPage()
        {
            InitializeComponent();
            _partnerId = 0;
            LoadPartners();
            DataContext = this;
        }

        private void LoadPartners()
        {
            using (var db = new Entities())
            {
                Partners = db.Partner.ToList();
            }

            PartnersComboBox.ItemsSource = Partners;
        }

        private void LoadSalesHistory()
        {
            if (_partnerId == 0) return;

            using (var db = new Entities())
            {
                SalesHistory = db.PartnerSales
                    .Where(s => s.Partner == _partnerId)
                    .ToList()
                    .Select(s => new SaleInfo
                    {
                        ProductName = db.Product.FirstOrDefault(p => p.ID == s.Product)?.Name ?? "Неизвестный продукт",
                        Quantity = (int)s.Amount,
                        SaleDate = s.SaleDate.ToString() 
                    })
                    .ToList();
            }

            dGridSales.ItemsSource = SalesHistory;
        }


        private void PartnersComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedPartner = PartnersComboBox.SelectedItem as Partner;
            if (selectedPartner != null)
            {
                _partnerId = selectedPartner.ID; 
                LoadSalesHistory(); 
            }
        }

    }

    public class SaleInfo
    {
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public string SaleDate { get; set; }
    }
}
