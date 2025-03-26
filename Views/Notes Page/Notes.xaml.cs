using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using CapstoneMobileApp.Views.Reports_Page;
using CapstoneMobileApp.Views.Search_Page;

namespace CapstoneMobileApp.Notes_Page;

public partial class Notes : ContentPage
{
    private Course _selectedCourse;
    public Notes(Course course)
    {
        InitializeComponent();

        _selectedCourse = course;

        NotesTitle.Text = $"Notes for {course.CourseName}";

        BindingContext = _selectedCourse;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        await PopulateNotes();

    }

    private async Task PopulateNotes()
    {
        var notes = await DatabaseService.GetNotes(_selectedCourse.CourseId);

        _selectedCourse.Notes.Clear();

        foreach (var note in notes)
        {
            _selectedCourse.Notes.Add(note);
        }

    }

    private async void OnBoxTapped(object sender, EventArgs e)
    {
        if (sender is Border border && border.BindingContext is Note note)
        {
            await Navigation.PushAsync(new AddEditNotes("Edit", _selectedCourse.CourseId, note));
        }

    }

    private async void AddNotesButton_Clicked(object sender, EventArgs args)
    {
        await Navigation.PushAsync(new AddEditNotes("Add", _selectedCourse.CourseId));
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