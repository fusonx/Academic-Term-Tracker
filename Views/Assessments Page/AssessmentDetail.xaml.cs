using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;

namespace CapstoneMobileApp.Views.Assessments_Page;

public partial class AssessmentDetail : ContentPage
{
	private Assessment _assessment;
	public AssessmentDetail(Assessment assessment)
	{
		InitializeComponent();

		_assessment = assessment;
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var assessmentQuery = await DatabaseService.GetAssessment(_assessment.AssessmentId);

        if (assessmentQuery != null)
        {
            _assessment.AssessmentName = assessmentQuery.AssessmentName;
            _assessment.AssessmentType = assessmentQuery.AssessmentType;
            _assessment.TestDate = assessmentQuery.TestDate;
            _assessment.TestNotification = assessmentQuery.TestNotification;

            RefreshInfo();
        }
    }

    private void RefreshInfo()
    {
        AssessmentName.Text = _assessment.AssessmentName;
        AssessmentType.Text = _assessment.AssessmentType;
        AssessmentTestDate.Text = _assessment.DisplayTestDate;
        TestNotification.Text = _assessment.TestNotification;
    }

    private async void EditAssessment_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new EditAssessment(_assessment));
    }

    private async void DeleteAssessment_Clicked(object sender, EventArgs e)
    {
        var answer = await DisplayAlert("Delete Assessment?", "Delete this assessment?", "Yes", "No");

        if (answer == true)
        {
            var id = _assessment.AssessmentId;

            await DatabaseService.RemoveAssessment(id);

            await Navigation.PopAsync();
        }
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