using CapstoneMobileApp.Services;
using CapstoneMobileApp.Models;
using CapstoneMobileApp.Views;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.ComponentModel;
using System.Threading;
using System.Threading.Tasks;

namespace CapstoneMobileApp.Views.Search_Page;

public partial class SearchPage : ContentPage, INotifyPropertyChanged
{
    public ObservableCollection<SearchResults> ResultsCollection { get; set; } = new();

	private CancellationTokenSource _cts;
	private string _searchText;
	public string SearchText
	{
		get => _searchText;
		set
		{
			if (_searchText != value)
			{
				_searchText = value;
				OnPropertyChanged(nameof(SearchText));
				PerformAsyncSearch();
			}
		}
	}
    public SearchPage()
	{
		InitializeComponent();
		BindingContext = this;

    }

    private async void PerformAsyncSearch()
	{

		_cts?.Cancel();
		_cts = new CancellationTokenSource();
		var token = _cts.Token;

        if (string.IsNullOrEmpty(SearchText))
        {
            ClearResults();
			ResultsDisplay.IsVisible = false;
            return;
        }
        try
		{
            await Task.Delay(300, token);

            await DatabaseService.SearchQuery(this, SearchText);

            ResultsDisplay.IsVisible = true;
        }
		catch (TaskCanceledException)
		{

		}

    }

	private void ClearResults()
	{
		ResultsCollection.Clear();
	}

	public event PropertyChangedEventHandler PropertyChanged;
	protected virtual void OnPropertyChanged(string propertyName)
	{
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}

}