using CapstoneMobileApp.Assessments_Page;
using CapstoneMobileApp.Models;
using CapstoneMobileApp.Notes_Page;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Assessments_Page;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;
using CapstoneMobileApp.Views.Homeworks;

namespace CapstoneMobileApp.Courses_Page;

public partial class CourseDetail : ContentPage
{
    private Course _selectedCourse;
    private int _termId;
    public CourseDetail(Course course)
    {
        InitializeComponent();

        _selectedCourse = course;
        _termId = _selectedCourse.TermId;

        BindingContext = _selectedCourse;

    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var courseQuery = await DatabaseService.GetCourse(_selectedCourse.CourseId);

        if (courseQuery != null)
        {
            _selectedCourse.CourseName = courseQuery.CourseName;
            _selectedCourse.StartDate = courseQuery.StartDate;
            _selectedCourse.EndDate = courseQuery.EndDate;
            _selectedCourse.DueDate = courseQuery.DueDate;
            _selectedCourse.CourseStatus = courseQuery.CourseStatus;
            _selectedCourse.StartNotification = courseQuery.StartNotification;
            _selectedCourse.EndNotification = courseQuery.EndNotification;
            _selectedCourse.InstructorName = courseQuery.InstructorName;
            _selectedCourse.InstructorPhone = courseQuery.InstructorPhone;
            _selectedCourse.InstructorEmail = courseQuery.InstructorEmail;


            RefreshInfo();
        }
    }

    private void RefreshInfo()
    {
        CourseName.Text = _selectedCourse.CourseName;
        CourseStartEndDate.Text = _selectedCourse.DisplayStartEndDate;
        CourseDueDate.Text = _selectedCourse.DisplayDueDate;
        CourseStatus.Text = _selectedCourse.CourseStatus;
        StartNotification.Text = _selectedCourse.StartNotification;
        EndNotification.Text = _selectedCourse.EndNotification;
        InstructorName.Text = _selectedCourse.InstructorName;
        InstructorNumber.Text = _selectedCourse.InstructorPhone;
        InstructorEmail.Text = _selectedCourse.InstructorEmail;
    }

    private async void EditCourse_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddEditCourse("Edit", _termId, _selectedCourse));
    }

    private async void DeleteCourse_Clicked(object sender, EventArgs e)
    {
        var answer = await DisplayAlert("Delete Course and Related Information?", "Delete this course?", "Yes", "No");

        if (answer == true)
        {
            var id = _selectedCourse.CourseId;

            await DatabaseService.RemoveCourse(id);

            await Navigation.PopAsync();
        }

    }

    private async void OnHomeworkBoxTapped(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new Homeworks(_selectedCourse));
    }

    private void OnInstructorBoxTapped(object sender, EventArgs e)
    {
        HiddenInstructorContent.IsVisible = !HiddenInstructorContent.IsVisible;

        if (HiddenInstructorContent.IsVisible)
        {
            InstructorCaret.Rotation = 180;
        }

        else if (!HiddenInstructorContent.IsVisible)
        {
            InstructorCaret.Rotation = 0;
        }
    }

    private async void OnAssessmentsBoxTapped(object sender, EventArgs args)
    {
        await Navigation.PushAsync(new Assessments(_selectedCourse));
    }

    private async void OnNotesBoxTapped(object sender, EventArgs args)
    {
        await Navigation.PushAsync(new Notes(_selectedCourse));
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