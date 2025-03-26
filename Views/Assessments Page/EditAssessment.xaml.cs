using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;

namespace CapstoneMobileApp.Views.Assessments_Page;

public partial class EditAssessment : ContentPage
{
    private Assessment _assessment;
    private int _assessmentId;

    public EditAssessment(Assessment assessment)
    {
        InitializeComponent();

        _assessment = assessment;
        _assessmentId = _assessment.AssessmentId;

    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        PopulateFields();
    }

    private void PopulateFields()
    {
        EditorAssessmentName.Text = _assessment.AssessmentName;
        PickerAssessmentType.SelectedItem = _assessment.AssessmentType;
        TestDate.Date = _assessment.TestDate;
        PickerTestDate.SelectedItem = _assessment.TestNotification;
    }

    private async void SaveAssessment_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(EditorAssessmentName.Text))
        {
            await DisplayAlert("Missing Assessment Name", "Please enter an assessment name.", "OK");
            return;
        }

        if (PickerAssessmentType.SelectedItem is null)
        {
            await DisplayAlert("No Assessment Type Selection", "Please choose an assessment type.", "OK");
            return;
        }


        if (TestDate.Date < DateTime.Today)
        {
            await DisplayAlert("Incorrect Date Selection", "Please choose a date that is today or later.", "OK");
            return;
        }

        if (PickerTestDate.SelectedItem is null)
        {
            await DisplayAlert("No Notification Selection", "Please choose a notification status.", "OK");
            return;
        }

        string selectedTestNotification = (string)PickerTestDate.SelectedItem;
        string selectedType = (string)PickerAssessmentType.SelectedItem;

        await DatabaseService.UpdateAssessment(_assessmentId, EditorAssessmentName.Text, selectedType, TestDate.Date, selectedTestNotification);

        await Navigation.PopAsync();
    }

    private async void CancelAssessment_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }
}