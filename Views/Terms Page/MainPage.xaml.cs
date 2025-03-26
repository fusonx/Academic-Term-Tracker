using CapstoneMobileApp.Courses_Page;
using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views;
using CapstoneMobileApp.Terms_Page;
using CapstoneMobileApp.Views.Search_Page;
using CapstoneMobileApp.Views.Reports_Page;

namespace CapstoneMobileApp
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (Services.Settings.FirstRun)
            {
                await DatabaseService.LoadSampleData();

                Services.Settings.FirstRun = false;

                await RefreshTermCollectionView();
            }

            await RefreshTermCollectionView();


        }


        private async Task RefreshTermCollectionView()
        {
            TermsCollectionView.ItemsSource = null;
            var terms = await DatabaseService.GetTerms();

            TermsCollectionView.ItemsSource = terms;

        }

        private async void OnBoxTapped(object sender, EventArgs e)
        {
            if (sender is Border border && border.BindingContext is Term term)
            {
                await Navigation.PushAsync(new Courses(term));
            }
        }

        private async void AddTermButton_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AddEditTerm("Add"));
        }

        private async void OnSearch_Clicked(object sender, EventArgs e)
        {

            await Navigation.PushAsync(new SearchPage());
        }

        private async void OnReports_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Reports());
        }

    }

}
