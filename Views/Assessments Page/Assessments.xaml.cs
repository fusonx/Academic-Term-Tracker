using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Assessments_Page;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;
using CommunityToolkit.Maui.Converters;
using CommunityToolkit.Maui.Extensions;
using Microsoft.Maui.Graphics.Text;
using Plugin.LocalNotification;
using System.Diagnostics;

namespace CapstoneMobileApp.Assessments_Page;

public partial class Assessments : ContentPage
{
    private Course _selectedCourse;
    private int _courseId;

    public Assessments(Course course)
    {
        InitializeComponent();

        _selectedCourse = course;
        _courseId = _selectedCourse.CourseId;

        CourseTitleAssessment.Text = $"Assessments for {_selectedCourse.CourseName}";

        BindingContext = _selectedCourse;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        await PopulateAssessments();

        ShowAssessmentNotifications();

    }

    private async Task PopulateAssessments()
    {
        var assessments = await DatabaseService.GetAssessments(_courseId);

        _selectedCourse.Assessments.Clear();

        foreach (var assessment in assessments)
        {
            _selectedCourse.Assessments.Add(assessment);
        }

    }

    private async void ShowAssessmentNotifications()
    {
        if (await LocalNotificationCenter.Current.AreNotificationsEnabled() == false)
        {
            await LocalNotificationCenter.Current.RequestNotificationPermission();
        }

        var assessments = await DatabaseService.GetAssessments();
        var notifyRandom = new Random();

        if (assessments != null)
        {
            foreach (Assessment assessment in assessments)
            {
                if (assessment.TestNotification == "On")
                {
                    if (assessment.TestDate == DateTime.Today)
                    {
                        var notifyId = notifyRandom.Next(1000);

                        var notification = new NotificationRequest
                        {
                            NotificationId = notifyId,
                            Title = "Assessment",
                            Description = $"{assessment.AssessmentName} is today!",
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
        if (sender is Border border && border.BindingContext is Assessment assessment)
        {
            await Navigation.PushAsync(new AssessmentDetail(assessment));
        }
    }

    private async void AddAssessmentButton_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddAssessment(_courseId));
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