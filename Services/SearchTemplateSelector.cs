using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapstoneMobileApp.Models;

namespace CapstoneMobileApp.Services
{
    public class SearchTemplateSelector : DataTemplateSelector
    {
        public DataTemplate TermTemplate { get; set; }
        public DataTemplate CourseTemplate { get; set; }
        public DataTemplate InstructorTemplate { get; set; }
        public DataTemplate HomeworkTemplate { get; set; }
        public DataTemplate AssessmentTemplate { get; set; }
        public DataTemplate NoteTemplate { get; set; }

        protected override DataTemplate OnSelectTemplate(object item, BindableObject container)
        {

            if (item is TermResult)
                return TermTemplate;
            else if (item is CourseResult)
                return CourseTemplate;
            else if (item is InstructorResult)
                return InstructorTemplate;
            else if (item is HomeworkResult)
                return HomeworkTemplate;
            else if (item is AssessmentResult)
                return AssessmentTemplate;
            else if (item is NoteResult)
                return NoteTemplate;


            return base.SelectTemplate(item, container);
        }
    }
}
