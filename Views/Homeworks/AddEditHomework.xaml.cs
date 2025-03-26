using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views;
using System.Diagnostics;

namespace CapstoneMobileApp.Views.Homeworks;

public partial class AddEditHomework : ContentPage
{
	private Homework _homework;
	private string _actionType;
	private int _courseId;
	public AddEditHomework(string actionType, int courseId, Homework homework = null)
	{
		InitializeComponent();

		_homework = homework;
		_actionType = actionType;
		_courseId = courseId;

        Title = _actionType == "Add" ? "Add Homework" : "Edit Homework";

		if (_actionType == "Edit")
		{
			EditorHomeworkName.Text = _homework.HomeworkName;
			EditorHomeworkType.Text = _homework.HomeworkType;
			DueDate.Date = _homework.DueDate;
			PickerDueDateNotification.SelectedItem = _homework.DueDateNotification;
		}
    }

	private async void HomeworkSaved_Clicked(object sender, EventArgs e)
	{

        if (string.IsNullOrEmpty(EditorHomeworkName.Text))
        {
            await DisplayAlert("Missing Homework Name", "Please enter a homework name.", "OK");
            return;
        }

        if (string.IsNullOrEmpty(EditorHomeworkType.Text))
        {
            await DisplayAlert("Missing Homework Type", "Please enter a homework type.", "OK");
            return;
        }

		var dueDate = DueDate.Date;

		if (dueDate < DateTime.Today)
		{
			await DisplayAlert("Incorrect Date Range", "Please select a date from today forward.", "OK");
			return;
		}

		if (PickerDueDateNotification.SelectedItem is null)
		{
			await DisplayAlert("No Due Date Notification Selection", "Please select a due date notification.", "OK");
			return;
		}

		string selectedDueDateNotification = (string)PickerDueDateNotification.SelectedItem;

		if (_actionType == "Add")
		{

			await DatabaseService.AddHomework(_courseId, EditorHomeworkName.Text, EditorHomeworkType.Text, dueDate, selectedDueDateNotification);
		}

		else if (_actionType == "Edit")
		{
			await DatabaseService.UpdateHomework(_homework.HomeworkId, EditorHomeworkName.Text, EditorHomeworkType.Text, dueDate, selectedDueDateNotification);
		}

        await Navigation.PopAsync();
    }

	private async void HomeworkCancel_Clicked(object sender, EventArgs e)
	{
		await Navigation.PopAsync();
	}
}