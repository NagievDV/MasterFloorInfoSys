using MasterFloorInfoSys.ViewModels;
using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MasterFloorInfoSys.Pages
{
    public partial class AddPartner : Page
    {
        private Partner _currentPartner = new Partner();
        private PartnerViewModel _viewModel;

        public AddPartner(Partner selectedPartner)
        {
            InitializeComponent();

            if (selectedPartner != null)
                _currentPartner = selectedPartner;

            _viewModel = new PartnerViewModel(_currentPartner);

            DataContext = _viewModel;

            LoadPartnerTypes();
        }

        private void LoadPartnerTypes()
        {
            try
            {
                var partnerTypes = Entities.GetContext().PartnerType.ToList();
                cmbPartnerType.ItemsSource = partnerTypes;
                cmbPartnerType.DisplayMemberPath = "Type";
                cmbPartnerType.SelectedValuePath = "ID";
                cmbPartnerType.SelectedValue = _viewModel.PartnerTypeID;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки типов партнеров: {ex.Message}");
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_viewModel.Name))
                errors.AppendLine("Пожалуйста укажите наименование.");
            if (string.IsNullOrWhiteSpace(_viewModel.CEOFullName))
                errors.AppendLine("Пожалуйста укажите полное ФИО директора.");
            if (cmbPartnerType.SelectedIndex == -1)
                errors.AppendLine("Пожалуйста выберите тип партнера.");
            if (string.IsNullOrWhiteSpace(_viewModel.Email) || !_viewModel.Email.Contains("@"))
                errors.AppendLine("Пожалуйста укажите корректный email.");
            if (string.IsNullOrWhiteSpace(_viewModel.PhoneNumber) || _viewModel.PhoneNumber.Length < 10)
                errors.AppendLine("Пожалуйста укажите корректный номер телефона.");
            if (string.IsNullOrWhiteSpace(_viewModel.TIN) || _viewModel.TIN.Length != 10)
                errors.AppendLine("Пожалуйста укажите корректный ИНН (10 цифр).");
            if (string.IsNullOrWhiteSpace(_viewModel.Rating.ToString()))
                errors.AppendLine("Пожалуйста укажите рейтинг.");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            var ceoParts = _viewModel.CEOFullName.Split(' ');

            if (ceoParts.Length < 3)
            {
                MessageBox.Show("Укажите ФИО в формате: Имя Отчество Фамилия.");
                return;
            }

            _currentPartner.CEOFirstName = ceoParts[0];
            _currentPartner.CEOMiddleName = ceoParts[1];
            _currentPartner.CEOLastName = ceoParts[2];
            _currentPartner.Name = _viewModel.Name;
            _currentPartner.Email = _viewModel.Email;
            _currentPartner.PhoneNumber = _viewModel.PhoneNumber;
            _currentPartner.Address = _viewModel.Address;
            _currentPartner.TIN = _viewModel.TIN;
            _currentPartner.Rating = _viewModel.Rating;

            _currentPartner.PartnerType1 = cmbPartnerType.SelectedItem as PartnerType;

            if (_currentPartner.ID == 0)
                Entities.GetContext().Partner.Add(_currentPartner);

            try
            {
                Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения данных: {ex.Message}");
            }
            NavigationService?.GoBack();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.GoBack();
        }
    }

}
