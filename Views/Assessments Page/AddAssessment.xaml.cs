using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;

namespace CapstoneMobileApp.Assessments_Page;

public partial class AddAssessment : ContentPage
{
    private int _courseId;
    public AddAssessment(int courseId)
    {
        InitializeComponent();

        _courseId = courseId;
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

        await DatabaseService.AddAssessment(_courseId, EditorAssessmentName.Text, selectedType, TestDate.Date, selectedTestNotification);

        await Navigation.PopAsync();

    }

    private async void CancelAssessment_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }
}