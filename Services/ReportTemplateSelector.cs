using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapstoneMobileApp.Models;

namespace CapstoneMobileApp.Services
{
    public class ReportTemplateSelector : DataTemplateSelector
    {
       public DataTemplate TermReportTemplate { get; set; }
        public DataTemplate CourseReportTemplate { get; set; }
        public DataTemplate AssessmentReportTemplate { get; set; }
        public DataTemplate HomeworkReportTemplate { get; set; }

        protected override DataTemplate OnSelectTemplate(object item, BindableObject container)
        {
            if (item is Term)
                return TermReportTemplate;
            else if (item is Course)
                return CourseReportTemplate;
            else if (item is Assessment)
                return AssessmentReportTemplate;
            else if (item is Homework)
                return HomeworkReportTemplate;

            return base.SelectTemplate(item, container);
        }
    }
}
