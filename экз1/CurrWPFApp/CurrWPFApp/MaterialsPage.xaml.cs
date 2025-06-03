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
using System.Runtime.Remoting.Contexts;

namespace CurrWPFApp
{
    /// <summary>
    /// Логика взаимодействия для MaterialsPage.xaml
    /// </summary>
    public partial class MaterialsPage : Page
    {
        public MaterialsPage()
        {
            InitializeComponent();
            Manager.PageTitle.Text = "Список материалов";

            LoadData();
        }

        public void LoadData()
        {
            // Получаем список материалов вместе со связанными типами и пробрасываем в датагрид.
            var materials = BaseEntities.GetContext().Materials
        .Include(p => p.MaterialType)
        .Include(p => p.MaterialProducts)
        .Select(p => new MaterialDate
        {
            Id = p.Id,
            MaterialType1 = p.MaterialType.MaterialType1,
            MaterialName = p.MaterialName,
            MinQuantity = p.MinQuantity,
            HasQuantity = p.HasQuantity,
            CheckStyle = p.CheckStyle,
            PriceByOne = p.PriceByOne,
            QuantityInOne = p.QuantityInOne,
            NeedQuantity = p.MaterialProducts.Sum(mp => mp.QuaForBuild) ?? 0
        })
        .ToList();

            DGridMaterials.ItemsSource = materials;
        }

        public class MaterialDate
        {
            public int Id { get; set; }
            public string MaterialType1 { get; set; }
            public string MaterialName { get; set; }
            public double? PriceByOne { get; set; }
            public double? MinQuantity { get; set; }
            public double? HasQuantity { get; set; }
            public string CheckStyle { get; set; }
            public double? QuantityInOne { get; set; }
            public double NeedQuantity { get; set; }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = (sender as Button).DataContext as MaterialDate;
            if (selectedItem == null)
            {
                MessageBox.Show("Sosal");
                return;
            }
            else
            {
                var loadeditem = BaseEntities.GetContext().Materials
                    .Include(p => p.MaterialType)
                    .FirstOrDefault(p => p.Id == selectedItem.Id);
                Manager.MainFrame.Navigate(new AddEditMaterialPage(loadeditem));
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditMaterialPage(null));

        }

        private void BtnMore_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if(Visibility == Visibility.Visible)
            {
                BaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LoadData();
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
