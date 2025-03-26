using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;

namespace CapstoneMobileApp.Terms_Page;

public partial class AddEditTerm : ContentPage
{
    private Term _term;
    private string _actionType;
    public AddEditTerm(string actionType, Term term = null)
    {
        InitializeComponent();

        Title = actionType == "Add" ? "Add Term" : "Edit Term";

        _actionType = actionType;


        if (actionType == "Edit")
        {
            _term = term;
            EditorTermName.Text = term.TermName;
            TermStartDate.Date = term.StartDate;
            TermEndDate.Date = term.EndDate;
        }
    }


    private async void TermSaved_Clicked(object sender, EventArgs e)
    {

        if (string.IsNullOrEmpty(EditorTermName.Text))
        {
            await DisplayAlert("Missing Term Name", "Please enter a term name.", "OK");
            return;
        }

        var startDate = TermStartDate.Date;
        var endDate = TermEndDate.Date;

        if (startDate >= endDate)
        {
            await DisplayAlert("Incorrect Date Range", "Please ensure the start date is before the end date", "OK");
            return;
        }

        if (_actionType == "Edit")
        {
            await DatabaseService.UpdateTerm(_term.TermId, EditorTermName.Text, TermStartDate.Date, TermEndDate.Date);
        }
        else
        {
            await DatabaseService.AddTerm(EditorTermName.Text, TermStartDate.Date, TermEndDate.Date);
        }

        await Navigation.PushAsync(new MainPage());
    }

    private async void TermCancel_Clicked(object obj, EventArgs e)
    {
        await Navigation.PopAsync();
    }
}