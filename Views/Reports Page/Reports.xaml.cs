using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using CapstoneMobileApp.Services;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CapstoneMobileApp.Views.Reports_Page;

public partial class Reports : ContentPage, INotifyPropertyChanged
{
    public ObservableCollection<object> ReportResults { get; set; } = new();
    private ObservableCollection<string> _pickerOptions;
	public ObservableCollection<string> PickerOptions
	{
		get => _pickerOptions;
		set
		{
			_pickerOptions = value;
			OnPropertyChanged(nameof(PickerOptions));
		}
	}

	public Reports()
	{
		InitializeComponent();
		BindingContext = this;

		PickerOptions = new ObservableCollection<string> { "Date", "Completed", "Remaining", "Status", "Type" };
	}

	private void OnReportTypeChanged(object sender, EventArgs e)
	{
		if (PickerReportType.SelectedIndex == -1)
		{
			PickerFilterBy.IsEnabled = false;
		}

		else
		{
            PickerFilterBy.IsEnabled = true;

            string selectedValue = PickerReportType.SelectedItem as string;

            if (selectedValue == "Terms")
            {
                PickerOptions.Clear();
                PickerOptions.Add("Date");
                PickerOptions.Add("Completed");
                PickerOptions.Add("Remaining");
            }

            else if (selectedValue == "Courses")
            {
                PickerOptions.Clear();
                PickerOptions.Add("Date");
                PickerOptions.Add("Completed");
                PickerOptions.Add("Remaining");
                PickerOptions.Add("Status");
            }

            else if (selectedValue == "Assessments")
            {
                PickerOptions.Clear();
                PickerOptions.Add("Completed");
                PickerOptions.Add("Remaining");
                PickerOptions.Add("Type");
            }

            else if (selectedValue == "Homework")
            {
                PickerOptions.Clear();
                PickerOptions.Add("Completed");
                PickerOptions.Add("Remaining");
                PickerOptions.Add("Type");
            }
        }
		
	}

	private void OnFilterChanged(object sender, EventArgs e)
	{
        if (PickerFilterBy.SelectedIndex == -1) return;

        HideAllBoxes();

        string selectedReportType = PickerReportType.SelectedItem as string;
        string selectedFilterValue = PickerFilterBy.SelectedItem as string;

		if (selectedFilterValue == "Type" && selectedReportType == "Assessments")
		{
			AssessmentTypeFilter.IsVisible = true;
		}

		else if (selectedFilterValue == "Type" && selectedReportType == "Homework")
		{
			HomeworkTypeFilter.IsVisible = true;
		}

		else if (selectedFilterValue == "Date" && (selectedReportType == "Terms" || selectedReportType == "Courses"))
		{
			DateFilter.IsVisible = true;
		}

		else if (selectedFilterValue == "Status")
		{
			StatusFilter.IsVisible = true;
		}
	}

	private async void OnGenerateReport_Clicked(object sender, EventArgs e)
	{
        if (PickerReportType.SelectedIndex == -1)
		{
			await DisplayAlert("No Report Type Selected", "Please select a report type.", "OK");
			return;
		}

        if (PickerFilterBy.SelectedIndex == -1)
		{
            await DisplayAlert("No Filter Selected", "Please select a filter.", "OK");
            return;
        }

        ReportResults.Clear();

        GenerateReportButton.IsVisible = false;
		GenerateReportButton.IsEnabled = false;

		ClearReportButton.IsVisible = true;
		ClearReportButton.IsEnabled = true;

		TimeStamp.IsVisible = true;

        HideAllBoxes();
		HideReportCriteria();

        string selectedReportType = PickerReportType.SelectedItem as string;
        string selectedFilterValue = PickerFilterBy.SelectedItem as string;

        UpdateHeaders(selectedReportType, selectedFilterValue);

        
		if (selectedFilterValue == "Date" && (selectedReportType == "Terms" || selectedReportType == "Courses"))
		{
			string report = selectedReportType;
			DateTime startDate = StartDatePicker.Date;
			DateTime endDate = EndDatePicker.Date;

			await DatabaseService.FilterTermCourseDates(this, report, startDate, endDate);
		}

		else if (selectedFilterValue == "Status" && selectedReportType == "Courses")
		{
			string status = PickerStatus.SelectedItem as string;

			await DatabaseService.FilterCourseByStatus(this, status);
		}

		else if (selectedFilterValue == "Type" && (selectedReportType == "Assessments" || selectedReportType == "Homework"))
		{

            if (selectedReportType == "Assessments")
			{
				string type = PickerAssessmentType.SelectedItem as string;

                await DatabaseService.FilterByType(this, selectedReportType, type);
			}

			else if (selectedReportType == "Homework")
			{
				string type = EditorHomeworkType.Text.ToLower();

				await DatabaseService.FilterByType(this, selectedReportType, type);
			}

        }

		else if (selectedFilterValue == "Completed")
		{
			await DatabaseService.FilterByCompleted(this, selectedReportType);
		}

		else if (selectedFilterValue == "Remaining")
		{
			await DatabaseService.FilterByRemaining(this, selectedReportType);
		}

		TimeStamp.Text = $"Report generated: {DateTime.Now}";

        FilterResults.IsVisible = true;

    }

	private void OnClearReport_Clicked(object sender, EventArgs e)
	{
		GenerateReportButton.IsVisible = true;
		GenerateReportButton.IsEnabled = true;

		ClearReportButton.IsVisible = false;
		ClearReportButton.IsEnabled = false;

        FilterResults.IsVisible = false;

		TimeStamp.IsVisible = false;

		ResetSelections();
		ShowReportCriteria();
	}


    private void HideAllBoxes()
	{
		AssessmentTypeFilter.IsVisible = false;
		HomeworkTypeFilter.IsVisible= false;
		DateFilter.IsVisible = false;
        StatusFilter.IsVisible = false;
	}

	private void HideReportCriteria()
	{
		ReportCriteria.IsVisible = false;
	}

	private void ShowReportCriteria()
	{
		ReportCriteria.IsVisible = true;
	}

	private void ResetSelections()
	{
		PickerReportType.SelectedItem = null;
		PickerStatus.SelectedItem = null;
		PickerAssessmentType.SelectedItem = null;
		PickerFilterBy.SelectedItem = null;
	}

	private void UpdateHeaders (string reportType, string filterValue)
	{
		if (reportType == "Terms")
		{
			HeaderColumn1.Text = "Name";
			HeaderColumn2.Text = "Start Date";
			HeaderColumn3.Text = "End Date";

			if (filterValue == "Completed" ||  filterValue == "Remaining")
			{
				ReportTitle.Text = $"{filterValue} Terms";
			}

			else if (filterValue == "Date")
			{
				ReportTitle.Text = "Terms By Date";
			}
		}

		else if (reportType == "Courses")
		{
			HeaderColumn1.Text = "Name";
			HeaderColumn2.Text = "Status";
			HeaderColumn3.Text = "Start/End Date";

            if (filterValue == "Completed" || filterValue == "Remaining")
            {
                ReportTitle.Text = $"{filterValue} Courses";
            }

			else if (filterValue == "Status")
			{
				ReportTitle.Text = "Courses by Status";
			}
        }

		else if (reportType == "Assessments")
		{
			HeaderColumn1.Text = "Name";
			HeaderColumn2.Text = "Type";
			HeaderColumn3.Text = "Test Date";

            if (filterValue == "Completed" || filterValue == "Remaining")
            {
                ReportTitle.Text = $"{filterValue} Assessments";
            }

			else if (filterValue == "Type")
			{
				ReportTitle.Text = "Assessments by Type";
			}
        }

		else if (reportType == "Homework")
		{
			HeaderColumn1.Text = "Name";
			HeaderColumn2.Text = "Type";
			HeaderColumn3.Text = "Due Date";

            if (filterValue == "Completed" || filterValue == "Remaining")
            {
                ReportTitle.Text = $"{filterValue} Homework";
            }

			else if (filterValue == "Type")
			{
                ReportTitle.Text = "Homework by Type";
            }
        }
	}

	public event PropertyChangedEventHandler PropertyChanged;
	protected virtual void OnPropertyChanged(string propertyName)
	{
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}


}