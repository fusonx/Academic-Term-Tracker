using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;
using Microsoft.VisualBasic;

namespace CapstoneMobileApp.Views.Homeworks;

public partial class HomeworkDetail : ContentPage
{
	private Homework _homework;
	private int _courseId;
	public HomeworkDetail(Homework homework)
	{
		InitializeComponent();

		_homework = homework;
		_courseId = _homework.CourseId;

	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var homeworkQuery = await DatabaseService.GetHomework(_homework.HomeworkId);

        if (homeworkQuery != null)
        {
            _homework.HomeworkName = homeworkQuery.HomeworkName;
            _homework.HomeworkType = homeworkQuery.HomeworkType;
            _homework.DueDate = homeworkQuery.DueDate;
            _homework.DueDateNotification = homeworkQuery.DueDateNotification;

            RefreshInfo();
        }

    }

    private void RefreshInfo()
    {
        HomeworkName.Text = _homework.HomeworkName;
        HomeworkType.Text = _homework.HomeworkType;
        HomeworkDueDate.Text = _homework.DisplayHomeworkDueDate;
        DueDateNotification.Text = _homework.DueDateNotification;
        
    }

    private async void EditHomework_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddEditHomework("Edit", _courseId, _homework));
    }
        

    private async void DeleteHomework_Clicked(object sender, EventArgs e)
    {
        var answer = await DisplayAlert("Delete Homework?", "Delete this homework?", "Yes", "No");

        if (answer == true)
        {
            var id = _homework.HomeworkId;

            await DatabaseService.RemoveHomework(id);

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