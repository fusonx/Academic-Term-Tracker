using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;

namespace CapstoneMobileApp.Notes_Page;

public partial class AddEditNotes : ContentPage
{
    private Note _note;
    private int _courseId;
    private string _actionType;
    public AddEditNotes(string actionType, int courseId, Note note = null)
    {
        InitializeComponent();

        Title = actionType == "Add" ? "Add Note" : "Edit Note";

        _actionType = actionType;
        _courseId = courseId;
        _note = note;

        if (actionType == "Edit" && note != null)
        {
            NoteEditor.Text = _note.Content;

            DeleteNote.IsEnabled = true;
        }

        else if (actionType == "Add" && note == null)
        {
            DeleteNote.IsEnabled = false;
        }
    }

    private async void SaveNote_Clicked(object sender, EventArgs args)
    {
        if (_actionType == "Add")
        {
            await DatabaseService.AddNote(_courseId, NoteEditor.Text, DateTime.Now);
            await Navigation.PopAsync();
        }

        else if (_actionType == "Edit")
        {
            await DatabaseService.UpdateNote(_note.NoteId, NoteEditor.Text, DateTime.Now);
            await Navigation.PopAsync();
        }

    }

    private async void DeleteNote_Clicked(object sender, EventArgs args)
    {
        if (_note == null)
        {
            await DisplayAlert("No Existing Note", "Save note first in order to delete.", "OK");
            return;
        }

        else
        {
            var answer = await DisplayAlert("Delete Note?", "Delete this note?", "Yes", "No");

            if (answer == true)
            {
                var id = _note.NoteId;

                await DatabaseService.RemoveNote(id);

                await Navigation.PopAsync();
            }
        }

    }

    private async void ShareNote_Clicked(object sender, EventArgs args)
    {
        string noteString = NoteEditor.Text;

        await ShareText(noteString);
    }

    private async Task ShareText(string text)
    {
        await Share.Default.RequestAsync(new ShareTextRequest
        {
            Text = text,
            Title = "Share Note"
        });
    }
}