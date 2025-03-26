using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using System.Text.RegularExpressions;

namespace CapstoneMobileApp.Courses_Page;

public partial class AddEditCourse : ContentPage
{
    private Course _course;
    private string _actionType;
    private int _termId;
    public AddEditCourse(string actionType, int termId, Course course = null)
    {
        InitializeComponent();

        Title = actionType == "Add" ? "Add Course" : "Edit Course";

        _termId = termId;
        _actionType = actionType;
        _course = course;


        if (actionType == "Edit")
        {

            EditorCourseName.Text = _course.CourseName;
            CourseStartDate.Date = _course.StartDate;
            CourseEndDate.Date = _course.EndDate;
            CourseDueDate.Date = _course.DueDate;
            CourseStatus.SelectedItem = _course.CourseStatus;
            StartNotification.SelectedItem = _course.StartNotification;
            EndNotification.SelectedItem = _course.EndNotification;
            EditorInstructorName.Text = _course.InstructorName;
            EditorInstructorNumber.Text = _course.InstructorPhone;
            EditorInstructorEmail.Text = _course.InstructorEmail;

        }

    }



    private async void CourseSaved_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(EditorCourseName.Text))
        {
            await DisplayAlert("Missing Course Name", "Please enter a course name.", "OK");
            return;
        }

        var startDate = CourseStartDate.Date;
        var endDate = CourseEndDate.Date;
        var dueDate = CourseDueDate.Date;

        if (startDate >= endDate)
        {
            await DisplayAlert("Incorrect Date Range", "Please ensure the end date is after the start date.", "OK");
            return;
        }

        if (endDate > dueDate)
        {
            await DisplayAlert("Incorrect Date Range", "Please ensure the due date is on or after the end date.", "OK");
            return;
        }

        if (CourseStatus.SelectedItem is null)
        {
            await DisplayAlert("No Course Status Selection", "Please choose a course status.", "OK");
            return;
        }

        if (StartNotification.SelectedItem is null)
        {
            await DisplayAlert("No Start Notification Selection", "Please make a start notification selection.", "OK");
            return;
        }

        if (EndNotification.SelectedItem is null)
        {
            await DisplayAlert("No End Notification Selection", "Please make an end notification selection.", "OK");
            return;
        }

        if (string.IsNullOrEmpty(EditorInstructorName.Text))
        {
            await DisplayAlert("Missing Instructor Name", "Please enter an instructor name.", "OK");
            return;
        }

        if (string.IsNullOrEmpty(EditorInstructorNumber.Text))
        {
            await DisplayAlert("Missing Instructor Phone Number", "Please enter an instructor phone number.", "OK");
            return;
        }

        string phonePattern = @"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$";
        Regex phoneRegex = new Regex(phonePattern);

        if (!phoneRegex.IsMatch(EditorInstructorNumber.Text))
        {
            await DisplayAlert("Incorrect Phone Number", "Please enter a valid phone number.", "OK");
            return;
        }

        if (string.IsNullOrEmpty(EditorInstructorEmail.Text))
        {
            await DisplayAlert("Missing Instructor Email", "Please enter an instructor email.", "OK");
            return;
        }

        string emailPattern = @"^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$";
        Regex emailRegex = new Regex(emailPattern);

        if (!emailRegex.IsMatch(EditorInstructorEmail.Text))
        {
            await DisplayAlert("Incorrect Email Address", "Please enter a valid email address.", "OK");
            return;
        }

        string selectedCourseStatus = (string)CourseStatus.SelectedItem;
        string startNotification = (string)StartNotification.SelectedItem;
        string endNotification = (string)EndNotification.SelectedItem;

        if (_actionType == "Edit")
        {
            await DatabaseService.UpdateCourse(_course.CourseId, EditorCourseName.Text, CourseStartDate.Date, CourseEndDate.Date, CourseDueDate.Date, selectedCourseStatus, startNotification, endNotification, EditorInstructorName.Text, EditorInstructorNumber.Text, EditorInstructorEmail.Text);
        }

        else if (_actionType == "Add")
        {
            await DatabaseService.AddCourse(_termId, EditorCourseName.Text, CourseStartDate.Date, CourseEndDate.Date, CourseDueDate.Date, selectedCourseStatus, startNotification, endNotification, EditorInstructorName.Text, EditorInstructorNumber.Text, EditorInstructorEmail.Text);
        }

        await Navigation.PopAsync();
    }

    private async void CourseCancel_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }
}