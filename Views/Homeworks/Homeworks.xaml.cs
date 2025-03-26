using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;
using Microsoft.VisualBasic;
using Plugin.LocalNotification;
using System.Diagnostics;

namespace CapstoneMobileApp.Views.Homeworks;

public partial class Homeworks : ContentPage
{
    private Course _course;
    private int _courseId;

	public Homeworks(Course course)
	{
		InitializeComponent();

        _course = course;
        _courseId = _course.CourseId;

        CourseTitleHomeworks.Text = $"Homework for {_course.CourseName}";

        BindingContext = _course;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        await PopulateHomeworks();

        ShowHomeworkNotifications();

    }

    private async Task PopulateHomeworks()
    {
        var homeworks = await DatabaseService.GetHomeworks(_courseId);

        _course.Homeworks.Clear();

        foreach (var homework in homeworks)
        {
            _course.Homeworks.Add(homework);
        }


    }

    private async void ShowHomeworkNotifications()
    {
        if (await LocalNotificationCenter.Current.AreNotificationsEnabled() == false)
        {
            await LocalNotificationCenter.Current.RequestNotificationPermission();
        }

        var homeworks = await DatabaseService.GetHomeworks();
        var notifyRandom = new Random();

        if (homeworks != null)
        {
            foreach (Homework homework in homeworks)
            {
                if (homework.DueDateNotification == "On")
                {
                    if (homework.DueDate == DateTime.Today)
                    {
                        var notifyId = notifyRandom.Next(1000);

                        var notification = new NotificationRequest
                        {
                            NotificationId = notifyId,
                            Title = "Assessment",
                            Description = $"{homework.HomeworkName} is due today!",
                            ReturningData = "Hello assessment notification!",
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

    }

    private async void OnBoxTapped(object sender, EventArgs e)
    {
        if (sender is Border border && border.BindingContext is Homework homework)
        {
            await Navigation.PushAsync(new HomeworkDetail(homework));
        }
    }

    private async void AddHomeworkButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddEditHomework("Add", _courseId));
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