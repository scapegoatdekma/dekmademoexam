using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace CurrWPFApp
{
    /// <summary>
    /// Логика взаимодействия для AddEditMaterialPage.xaml
    /// </summary>
    public partial class AddEditMaterialPage : Page
    {
        private Materials _currentMaterial = new Materials();
        public AddEditMaterialPage(Materials selectedMaterial)
        {
            InitializeComponent();
            if (selectedMaterial != null)
                _currentMaterial = selectedMaterial;
            DataContext = _currentMaterial;
            ComboMaterialType.ItemsSource = BaseEntities.GetContext().MaterialType.ToList();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (_currentMaterial.MaterialName == null)
                errors.AppendLine("Напишите имя!");
            if (_currentMaterial.MaterialType == null)
                errors.AppendLine("Выберите тип!");
            if (_currentMaterial.PriceByOne == null)
                errors.AppendLine("Напишите минимальную стоимость!");
            if (_currentMaterial.HasQuantity == null)
                errors.AppendLine("Напишите количество!");
            if (_currentMaterial.MinQuantity == null)
                errors.AppendLine("Напишите минимальное количество!");
            if (_currentMaterial.QuantityInOne == null)
                errors.AppendLine("Напишите количество в коробке!");
            if (_currentMaterial.CheckStyle == null)
                errors.AppendLine("Напишите единицу измерения!");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            if (BaseEntities.GetContext().Entry(_currentMaterial).State == EntityState.Detached)
            {
                BaseEntities.GetContext().Materials.Add(_currentMaterial);
            }
            try
            {
                BaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    
    }
}
