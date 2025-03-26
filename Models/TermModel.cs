using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace CapstoneMobileApp.Models
{
    public class Term
    {
        [PrimaryKey, AutoIncrement]
        public int TermId { get; set; }
        public string TermName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        [Ignore]
        public string DisplayTermDates => $"{StartDate:d} - {EndDate:d}";

        [Ignore]
        public string DisplayStartDate => $"{StartDate:d}";

        [Ignore]
        public string DisplayEndDate => $"{EndDate:d}";

        [Ignore]
        public ObservableCollection<Course> Courses { get; set; } = new ObservableCollection<Course>();

    }

    public class Course
    {
        [PrimaryKey, AutoIncrement]
        public int CourseId { get; set; }
        public int TermId { get; set; }
        public string CourseName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime DueDate { get; set; }
        public string CourseStatus { get; set; }
        public string InstructorName { get; set; }
        public string InstructorPhone { get; set; }
        public string InstructorEmail { get; set; }
        public string StartNotification { get; set; }
        public string EndNotification { get; set; }

        [Ignore]
        public string DisplayCourseNameStatus => $"{CourseName} ({CourseStatus})";

        [Ignore]
        public string DisplayCourseDates => $"{StartDate:d} - {EndDate:d}";

        [Ignore]
        public string DisplayStartEndDate => $"{StartDate:d} - {EndDate:d}";

        [Ignore]
        public string DisplayStartDate => $"{StartDate:d} -";

        [Ignore]
        public string DisplayEndDate => $"{EndDate:d}  ";

        [Ignore]
        public string DisplayDueDate => $"{DueDate:d}";

        [Ignore]
        public ObservableCollection<Note> Notes { get; set; } = new ObservableCollection<Note>();

        [Ignore]
        public ObservableCollection<Assessment> Assessments { get; set; } = new ObservableCollection<Assessment>();

        [Ignore]
        public ObservableCollection<Homework> Homeworks { get; set; } = new ObservableCollection<Homework>();

    }

    public class Homework
    {
        [PrimaryKey, AutoIncrement]
        public int HomeworkId { get; set; }
        public int CourseId { get; set; }
        public string HomeworkName { get; set; }
        public string HomeworkType { get; set; }
        public DateTime DueDate { get; set; }
        public string DueDateNotification { get; set; }

        [Ignore]
        public string DisplayHomeworkDueDate => $"Due: {DueDate:d}";

        [Ignore]
        public string DisplayHwNameType => $"{HomeworkName} ({HomeworkType})";

    }

    public class Assessment
    {
        [PrimaryKey, AutoIncrement]
        public int AssessmentId { get; set; }
        public int CourseId { get; set; }
        public string AssessmentName { get; set; }
        public string AssessmentType { get; set; }
        public DateTime TestDate { get; set; }
        public string TestNotification { get; set; }

        [Ignore]
        public string DisplayAssessmentNameType => $"{AssessmentName} ({AssessmentType})";

        [Ignore]
        public string DisplayTestDate => $"Test Date: {TestDate:d}";

        [Ignore]
        public string DisplayReportTestDate => $"{TestDate:d}";

    }

    public class Note
    {
        [PrimaryKey, AutoIncrement]
        public int NoteId { get; set; }
        public int CourseId { get; set; }
        public string Content { get; set; }
        public DateTime NoteDateCreated { get; set; }
    }

}
