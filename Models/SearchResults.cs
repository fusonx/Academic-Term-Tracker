using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapstoneMobileApp.Models
{
    public class SearchResults
    {
        public string Name { get; set; }
        public string Type { get; set; }

    }

    public class TermResult : SearchResults
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public string DisplayTermDates => $"{StartDate:d} - {EndDate:d}";
    }

    public class CourseResult : SearchResults
    {
        public string Status { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public string DisplayCourseNameStatus => $"{Name} ({Status})";
        public string DisplayStartEndDate => $"{StartDate:d} - {EndDate:d}";
    }

    public class InstructorResult : SearchResults
    {
        public string Phone { get; set; }
        public string Email { get; set; }
    }

    public class HomeworkResult : SearchResults
    {
        public DateTime DueDate { get; set; }

        public string DisplayHwNameType => $"{Name} ({Type})";
        public string DisplayHomeworkDueDate => $"Due: {DueDate:d}";

    }

    public class AssessmentResult : SearchResults
    {
        public DateTime TestDate { get; set; }

        public string DisplayAssessmentNameType => $"{Name} ({Type})";
        public string DisplayTestDate => $"Test Date: {TestDate:d}";
    }

    public class NoteResult : SearchResults
    {
        public string Content { get; set; }
    }
}
