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

namespace CurrWPFApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Manager.PageTitle = PageTitle; // необходимо для изменения подписи относительно открытой страницы
            Manager.MainFrame = MainFrame; // необходимо для доступа к фрейму во внешних страницах

            Manager.MainFrame.Navigate(new MaterialsPage());
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e) // функция выполняется после загрузки страницы
        {
            if (Manager.MainFrame.CanGoBack) // прячем кнопку всегда, когда страница не является корневой
                BtnBack.Visibility = Visibility.Visible;
            else 
                BtnBack.Visibility = Visibility.Hidden;
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            if(Manager.MainFrame.CanGoBack) 
                Manager.MainFrame.GoBack();
        }
    }
}
