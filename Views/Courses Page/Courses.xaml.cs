using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Terms_Page;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;
using Plugin.LocalNotification;

namespace CapstoneMobileApp.Courses_Page;

public partial class Courses : ContentPage
{
    private Term _selectedTerm;
    private int _termId;
    public Courses(Term term)
    {
        InitializeComponent();
        _selectedTerm = term;
        _termId = _selectedTerm.TermId;

        BindingContext = _selectedTerm;

    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        await LoadCourses();

        CourseCountCheck();

        ShowCourseNotifications();
    }

    private async Task LoadCourses()
    {
        var courses = await DatabaseService.GetCourses(_termId);

        _selectedTerm.Courses.Clear();

        foreach (var course in courses)
        {
            _selectedTerm.Courses.Add(course);
        }

    }

    private void CourseCountCheck()
    {
        var courseCount = _selectedTerm.Courses.Count;

        if (courseCount >= 6)
        {
            AddCourse.IsEnabled = false;
            AddCourse.IsVisible = false;
        }
        else
        {
            AddCourse.IsEnabled = true;
            AddCourse.IsVisible = true;
        }
    }

    private async void OnBoxTapped(object sender, EventArgs e)
    {
        if (sender is Border border && border.BindingContext is Course course)
        {
            await Navigation.PushAsync(new CourseDetail(course));
        }
    }

    private async void EditTerm_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddEditTerm("Edit", _selectedTerm));
    }

    private async void DeleteTerm_Clicked(object sender, EventArgs e)
    {
        var answer = await DisplayAlert("Delete Term and Related Information?", "Delete this term?", "Yes", "No");

        if (answer == true)
        {
            var id = _termId;

            await DatabaseService.RemoveTerm(id);

            await Navigation.PopAsync();
        }

    }

    private async void AddCourseButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddEditCourse("Add", _termId));
    }

    private async void ShowCourseNotifications()
    {
        if (await LocalNotificationCenter.Current.AreNotificationsEnabled() == false)
        {
            await LocalNotificationCenter.Current.RequestNotificationPermission();
        }

        var courseList = await DatabaseService.GetCourses();
        var notifyRandom = new Random();

        foreach (Course course in courseList)
        {
            if (course.StartNotification == "On")
            {
                if (course.StartDate == DateTime.Today)
                {
                    var notifyId = notifyRandom.Next(1000);

                    var notification = new NotificationRequest
                    {
                        NotificationId = notifyId,
                        Title = "Course Start Notification",
                        Description = $"{course.CourseName} begins today!",
                        ReturningData = "Hello course start notification",
                        BadgeNumber = 42,
                        Schedule = new NotificationRequestSchedule()
                        {
                            NotifyTime = DateTime.Now.AddSeconds(5),
                        }
                    };

                    await LocalNotificationCenter.Current.Show(notification);
                }
            }

            if (course.EndNotification == "On")
            {
                if (course.EndDate == DateTime.Today)
                {
                    var notifyId = notifyRandom.Next(1000);

                    var notification = new NotificationRequest
                    {
                        NotificationId = notifyId,
                        Title = "Course End Notification",
                        Description = $"{course.CourseName} ends today!",
                        ReturningData = "Hello course end notification",
                        BadgeNumber = 42,
                        Schedule = new NotificationRequestSchedule()
                        {
                            NotifyTime = DateTime.Now.AddSeconds(5),
                        }
                    };

                    await LocalNotificationCenter.Current.Show(notification);
                }
            }
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