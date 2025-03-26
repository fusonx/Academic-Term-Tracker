using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using SQLite;
using CapstoneMobileApp.Models;
using CapstoneMobileApp.Services;
using System.Diagnostics;
using CapstoneMobileApp.Assessments_Page;
using CapstoneMobileApp.Views.Homeworks;
using CapstoneMobileApp.Notes_Page;
using CapstoneMobileApp.Views.Search_Page;
using CapstoneMobileApp.Views.Reports_Page;

namespace CapstoneMobileApp.Services
{
    public static class DatabaseService
    {
        private static SQLiteAsyncConnection _db;
        private static IFileSystem _fileSystem = FileSystem.Current;

        static async Task Init()
        {
            if (_db != null)
            {
                return;
            }

            var databasePath = Path.Combine(_fileSystem.AppDataDirectory, "Models.db");

            _db = new SQLiteAsyncConnection(databasePath);

            await _db.CreateTableAsync<Term>();
            await _db.CreateTableAsync<Course>();
            await _db.CreateTableAsync<Homework>();
            await _db.CreateTableAsync<Assessment>();
            await _db.CreateTableAsync<Note>();
        }

        public static void SetFileSystemForTesting(IFileSystem fileSystem)
        {
            _fileSystem = fileSystem;
        }


        #region Term methods
        public static async Task AddTerm(string termName, DateTime startDate, DateTime endDate)
        {
            await Init();
            var term = new Term
            {
                TermName = termName,
                StartDate = startDate,
                EndDate = endDate
            };

            await _db.InsertAsync(term);
            var id = term.TermId;

        }

        public static async Task RemoveTerm(int termId)
        {
            await Init();

            var courses = await _db.Table<Course>().Where(c => c.TermId == termId).ToListAsync();
            foreach (var course in courses)
            {
                await RemoveCourse(course.CourseId);
            }


            await _db.DeleteAsync<Term>(termId);
        }

        public static async Task<IEnumerable<Term>> GetTerms()
        {
            await Init();

            var terms = await _db.Table<Term>().ToListAsync();
            return terms;
        }

        public static async Task UpdateTerm(int termId, string termName, DateTime startDate, DateTime endDate)
        {
            await Init();

            var termQuery = await _db.Table<Term>()
                .Where(i => i.TermId == termId)
                .FirstOrDefaultAsync();

            if (termQuery != null)
            {
                termQuery.TermName = termName;
                termQuery.StartDate = startDate;
                termQuery.EndDate = endDate;

                await _db.UpdateAsync(termQuery);
            }
        }
        #endregion

        #region Course methods
        public static async Task AddCourse(int termId, string courseName, DateTime startDate, DateTime endDate, DateTime dueDate, string courseStatus, string startNotification, string endNotification, string instructorName, string instructorPhone, string instructorEmail)
        {
            await Init();

            var course = new Course
            {
                TermId = termId,
                CourseName = courseName,
                StartDate = startDate,
                EndDate = endDate,
                DueDate = dueDate,
                StartNotification = startNotification,
                EndNotification = endNotification,
                CourseStatus = courseStatus,
                InstructorName = instructorName,
                InstructorPhone = instructorPhone,
                InstructorEmail = instructorEmail
            };

            await _db.InsertAsync(course);

            var id = course.CourseId;
        }

        public static async Task RemoveCourse(int courseId)
        {
            await Init();

            var homeworks = await _db.Table<Homework>().Where(h => h.CourseId == courseId).ToListAsync();
            foreach (var h in homeworks)
            {
                await RemoveHomework(h.HomeworkId);
            }

            var assessments = await _db.Table<Assessment>().Where(a => a.CourseId == courseId).ToListAsync();
            foreach (var assessment in assessments)
            {
                await RemoveAssessment(assessment.AssessmentId);
            }

            var notes = await _db.Table<Note>().Where(n => n.CourseId == courseId).ToListAsync();
            foreach (var note in notes)
            {
                await RemoveNote(note.NoteId);
            }

            await _db.DeleteAsync<Course>(courseId);
        }

        public static async Task<IEnumerable<Course>> GetCourses(int termId)
        {
            await Init();

            var courses = await _db.Table<Course>().Where(i => i.TermId == termId).ToListAsync();

            return courses;
        }

        public static async Task<IEnumerable<Course>> GetCourses()
        {
            await Init();
            var courses = await _db.Table<Course>().ToListAsync();

            return courses;
        }

        public static async Task<Course> GetCourse(int courseId)
        {
            await Init();

            return await _db.Table<Course>()
                .Where(i => i.CourseId == courseId)
                .FirstOrDefaultAsync();

        }

        public static async Task UpdateCourse(int courseId, string courseName, DateTime startDate, DateTime endDate, DateTime dueDate, string courseStatus, string startNotification, string endNotification, string instructorName, string instructorPhone, string instructorEmail)
        {
            await Init();

            var courseQuery = await _db.Table<Course>()
                .Where(i => i.CourseId == courseId)
                .FirstOrDefaultAsync();

            if (courseQuery != null)
            {
                courseQuery.CourseName = courseName;
                courseQuery.StartDate = startDate;
                courseQuery.EndDate = endDate;
                courseQuery.DueDate = dueDate;
                courseQuery.CourseStatus = courseStatus;
                courseQuery.StartNotification = startNotification;
                courseQuery.EndNotification = endNotification;
                courseQuery.InstructorName = instructorName;
                courseQuery.InstructorPhone = instructorPhone;
                courseQuery.InstructorEmail = instructorEmail;

                await _db.UpdateAsync(courseQuery);
            }
        }
        #endregion

        #region Note methods
        public static async Task AddNote(int courseId, string content, DateTime noteCreated)
        {
            await Init();

            var note = new Note
            {
                CourseId = courseId,
                Content = content,
                NoteDateCreated = noteCreated,
            };

            await _db.InsertAsync(note);
            var id = note.NoteId;
        }

        public static async Task RemoveNote(int noteId)
        {
            await Init();

            await _db.DeleteAsync<Note>(noteId);
        }

        public static async Task<IEnumerable<Note>> GetNotes(int courseId)
        {
            await Init();

            var notes = await _db.Table<Note>().Where(i => i.CourseId == courseId).ToListAsync();

            return notes;
        }

        public static async Task UpdateNote(int noteId, string content, DateTime noteCreated)
        {
            await Init();

            var noteQuery = await _db.Table<Note>()
                .Where(i => i.NoteId == noteId)
                .FirstOrDefaultAsync();

            if (noteQuery != null)
            {
                noteQuery.Content = content;
                noteQuery.NoteDateCreated = noteCreated;

                await _db.UpdateAsync(noteQuery);
            }
        }
        #endregion

        #region Assessment methods
        public static async Task AddAssessment(int courseId, string assessmentName, string assessmentType, DateTime testDate, string testNotification)
        {
            await Init();

            var assessment = new Assessment
            {
                CourseId = courseId,
                AssessmentName = assessmentName,
                AssessmentType = assessmentType,
                TestDate = testDate,
                TestNotification = testNotification
            };

            await _db.InsertAsync(assessment);
            var id = assessment.AssessmentId;
        }

        public static async Task<IEnumerable<Assessment>> GetAssessments()
        {
            await Init();

            var assessments = await _db.Table<Assessment>().ToListAsync();

            return assessments;
        }

        public static async Task<IEnumerable<Assessment>> GetAssessments(int courseId)
        {
            await Init();

            var assessments = await _db.Table<Assessment>().Where(i => i.CourseId == courseId).ToListAsync();

            return assessments;
        }

        public static async Task<Assessment> GetAssessment(int assessmentId)
        {
            await Init();

            return await _db.Table<Assessment>()
                .Where(i => i.AssessmentId == assessmentId)
                .FirstOrDefaultAsync();

        }

        public static async Task RemoveAssessment(int assessmentId)
        {
            await Init();

            await _db.DeleteAsync<Assessment>(assessmentId);
        }

        public static async Task UpdateAssessment(int assessmentId, string assessmentName, string assessmentType, DateTime testDate, string testNotification)
        {
            await Init();

            var assessmentQuery = await _db.Table<Assessment>()
                .Where(i => i.AssessmentId == assessmentId)
                .FirstOrDefaultAsync();

            if (assessmentQuery != null)
            {
                assessmentQuery.AssessmentName = assessmentName;
                assessmentQuery.AssessmentType = assessmentType;
                assessmentQuery.TestDate = testDate;
                assessmentQuery.TestNotification = testNotification;

                await _db.UpdateAsync(assessmentQuery);
            }
        }


        #endregion

        #region Homework methods
        public static async Task AddHomework(int courseId, string homeworkName, string homeworkType, DateTime dueDate, string dueDateNotification)
        {
            await Init();

            var homework = new Homework
            {
                CourseId = courseId,
                HomeworkName = homeworkName,
                HomeworkType = homeworkType,
                DueDate = dueDate,
                DueDateNotification = dueDateNotification
            };

            await _db.InsertAsync(homework);
            var id = homework.HomeworkId;
        }

        public static async Task<IEnumerable<Homework>> GetHomeworks()
        {
            await Init();

            var homeworks = await _db.Table<Homework>().ToListAsync();

            return homeworks;
        }

        public static async Task<IEnumerable<Homework>> GetHomeworks(int courseId)
        {
            await Init();

            var homeworks = await _db.Table<Homework>().Where(i => i.CourseId == courseId).ToListAsync();

            return homeworks;
        }

        public static async Task<Homework> GetHomework(int homeworkId)
        {
            await Init();

            return await _db.Table<Homework>()
                .Where(i => i.HomeworkId == homeworkId)
                .FirstOrDefaultAsync();

        }

        public static async Task RemoveHomework(int homeworkId)
        {
            await Init();

            await _db.DeleteAsync<Homework>(homeworkId);
        }

        public static async Task UpdateHomework(int homeworkId, string homeworkName, string homeworkType, DateTime dueDate, string dueDateNotification)
        {
            await Init();

            var homeworkQuery = await _db.Table<Homework>()
                .Where(i => i.HomeworkId == homeworkId)
                .FirstOrDefaultAsync();

            if (homeworkQuery != null)
            {
                homeworkQuery.HomeworkName = homeworkName;
                homeworkQuery.HomeworkType = homeworkType;
                homeworkQuery.DueDate = dueDate;
                homeworkQuery.DueDateNotification = dueDateNotification;

                await _db.UpdateAsync(homeworkQuery);
            }
        }


        #endregion

        #region Search methods
        public static async Task SearchQuery(SearchPage searchpage, string search)
        {
            await Init();

            searchpage.ResultsCollection.Clear();

            var termName = await _db.Table<Term>().Where(t => t.TermName.Contains(search)).ToListAsync();
            foreach (var term in termName)
            {

                searchpage.ResultsCollection.Add(new TermResult 
                { 
                    Name = term.TermName, 
                    StartDate = term.StartDate, 
                    EndDate = term.EndDate 
                });
            }


            var courseName = await _db.Table<Course>().Where(c => c.CourseName.Contains(search)).ToListAsync();
            foreach (var course in courseName)
            {
                searchpage.ResultsCollection.Add(new CourseResult
                {
                    Name = course.CourseName,
                    Status = course.CourseStatus,
                    StartDate = course.StartDate,
                    EndDate = course.EndDate
                });
            }

            var courseStatus = await _db.Table<Course>().Where(c => c.CourseStatus.Contains(search)).ToListAsync();
            foreach (var course in courseStatus)
            {
                searchpage.ResultsCollection.Add(new CourseResult
                {
                    Name = course.CourseName,
                    Status = course.CourseStatus,
                    StartDate = course.StartDate,
                    EndDate = course.EndDate
                });
            }

            var instructorName = await _db.Table<Course>().Where(i => i.InstructorName.Contains(search)).ToListAsync();
            foreach (var instructor in instructorName)
            {
                searchpage.ResultsCollection.Add(new InstructorResult
                {
                    Name = instructor.InstructorName,
                    Phone = instructor.InstructorPhone,
                    Email = instructor.InstructorEmail
                });
            }

            var instructorPhone = await _db.Table<Course>().Where(i => i.InstructorPhone.Contains(search)).ToListAsync();
            foreach (var phone in  instructorPhone)
            {
                searchpage.ResultsCollection.Add(new InstructorResult
                {
                    Name = phone.InstructorName,
                    Phone = phone.InstructorPhone,
                    Email = phone.InstructorEmail
                });
            }

            var instructorEmail = await _db.Table<Course>().Where(f => f.InstructorEmail.Contains(search)).ToListAsync();
            foreach (var email in instructorEmail)
            {
                searchpage.ResultsCollection.Add(new InstructorResult
                {
                    Name = email.InstructorName,
                    Phone = email.InstructorPhone,
                    Email = email.InstructorEmail
                });
            }

            var homeworkName = await _db.Table<Homework>().Where(g => g.HomeworkName.Contains(search)).ToListAsync();
            foreach (var homework in homeworkName)
            {
                searchpage.ResultsCollection.Add(new HomeworkResult
                {
                    Name = homework.HomeworkName,
                    Type = homework.HomeworkType,
                    DueDate = homework.DueDate
                });
            }

            var homeworkType = await _db.Table<Homework>().Where(h => h.HomeworkType.Contains(search)).ToListAsync();
            foreach (var type in homeworkType)
            {
                searchpage.ResultsCollection.Add(new HomeworkResult
                {
                    Name = type.HomeworkName,
                    Type = type.HomeworkType,
                    DueDate = type.DueDate
                });
            }

            var assessmentName = await _db.Table<Assessment>().Where(i => i.AssessmentName.Contains(search)).ToListAsync();
            foreach (var assessment in assessmentName)
            {
                searchpage.ResultsCollection.Add(new AssessmentResult
                {
                    Name = assessment.AssessmentName,
                    Type = assessment.AssessmentType,
                    TestDate = assessment.TestDate
                });
            }

            var assessmentType = await _db.Table<Assessment>().Where(i => i.AssessmentType.Contains(search)).ToListAsync();
            foreach (var assessment in assessmentType)
            {
                searchpage.ResultsCollection.Add(new AssessmentResult
                {
                    Name = assessment.AssessmentName,
                    Type = assessment.AssessmentType,
                    TestDate = assessment.TestDate
                });
            }

            var noteContent = await _db.Table<Note>().Where(j => j.Content.Contains(search)).ToListAsync();
            foreach (var note in noteContent)
            {
                searchpage.ResultsCollection.Add(new NoteResult
                {
                    Content = note.Content,
                });
            }

        }

        #endregion

        #region Report methods
        public static async Task FilterTermCourseDates(Reports report, string selectedReport, DateTime startDate, DateTime endDate)
        {
            await Init();

            if (selectedReport == "Terms")
            {

                var terms = await _db.Table<Term>().Where(t => t.StartDate >= startDate && t.EndDate <= endDate).ToListAsync();
                foreach (var term in terms)
                {
                    report.ReportResults.Add(new Term
                    {
                        TermName = term.TermName,
                        StartDate = term.StartDate,
                        EndDate = term.EndDate,
                    });
                }

            }

            else if (selectedReport == "Courses")
            {
                var courses = await _db.Table<Course>().Where(c => c.StartDate >= startDate &&  c.EndDate <= endDate).ToListAsync();
                foreach (var course in courses)
                {
                    report.ReportResults.Add(new Course
                    {
                        CourseName = course.CourseName,
                        CourseStatus = course.CourseStatus,
                        StartDate = course.StartDate,
                        EndDate = course.EndDate,
                    });
                }
            }
        }

        public static async Task FilterCourseByStatus(Reports report, string status)
        {
            await Init();

            var courses = await _db.Table<Course>().Where(c => c.CourseStatus == status).ToListAsync();
            foreach (var course in courses)
            {
                report.ReportResults.Add(new Course
                {
                    CourseName = course.CourseName,
                    CourseStatus = course.CourseStatus,
                    StartDate = course.StartDate,
                    EndDate = course.EndDate,
                });
            }
        }

        public static async Task FilterByType(Reports report, string selectedReport, string type)
        {
            await Init();

            if (selectedReport == "Assessments")
            {
                var assessments = await _db.Table<Assessment>().Where(a => a.AssessmentType == type).ToListAsync();
                foreach (var assessment in assessments)
                {
                    report.ReportResults.Add(new Assessment
                    {
                        AssessmentName = assessment.AssessmentName,
                        AssessmentType = assessment.AssessmentType,
                        TestDate = assessment.TestDate,
                    });
                }
            }

            else if (selectedReport == "Homework")
            {
                await Init();

                var homeworks = await _db.Table<Homework>().Where(h => h.HomeworkType.ToLower() == type).ToListAsync();
                foreach (var homework in homeworks)
                {
                    report.ReportResults.Add(new Homework
                    {
                        HomeworkName = homework.HomeworkName,
                        HomeworkType = homework.HomeworkType,
                        DueDate = homework.DueDate,
                    });
                }
            }
        }

        public static async Task FilterByCompleted(Reports report, string selectedReport)
        {
            await Init();

            if (selectedReport == "Terms")
            {

                var terms = await _db.Table<Term>().Where(t => t.EndDate <= DateTime.Today).ToListAsync();
                foreach (var term in terms)
                {
                    report.ReportResults.Add(new Term
                    {
                        TermName = term.TermName,
                        StartDate = term.StartDate,
                        EndDate = term.EndDate,
                    });
                }

            }

            else if (selectedReport == "Courses")
            {
                var courses = await _db.Table<Course>().Where(c => c.EndDate <= DateTime.Today).ToListAsync();
                foreach (var course in courses)
                {
                    report.ReportResults.Add(new Course
                    {
                        CourseName = course.CourseName,
                        CourseStatus = course.CourseStatus,
                        StartDate = course.StartDate,
                        EndDate = course.EndDate,
                    });
                }
            }

            else if (selectedReport == "Assessments")
            {
                var assessments = await _db.Table<Assessment>().Where(a => a.TestDate <= DateTime.Today).ToListAsync();
                foreach (var assessment in assessments)
                {
                    report.ReportResults.Add(new Assessment
                    {
                        AssessmentName = assessment.AssessmentName,
                        AssessmentType = assessment.AssessmentType,
                        TestDate = assessment.TestDate,
                    });
                }
            }

            else if (selectedReport == "Homework")
            {
                var homeworks = await _db.Table<Homework>().Where(h => h.DueDate <= DateTime.Today).ToListAsync();
                foreach (var homework in homeworks)
                {
                    report.ReportResults.Add(new Homework
                    {
                        HomeworkName = homework.HomeworkName,
                        HomeworkType = homework.HomeworkType,
                        DueDate = homework.DueDate,
                    });
                }
            }
        }

        public static async Task FilterByRemaining(Reports report, string selectedReport)
        {
            await Init();

            if (selectedReport == "Terms")
            {
                var terms = await _db.Table<Term>().Where(t => t.EndDate >= DateTime.Today).ToListAsync();
                foreach (var term in terms)
                {
                    report.ReportResults.Add(new Term
                    {
                        TermName = term.TermName,
                        StartDate = term.StartDate,
                        EndDate = term.EndDate,
                    });
                }
            }

            else if (selectedReport == "Courses")
            {
                var courses = await _db.Table<Course>().Where(c => c.EndDate >= DateTime.Today).ToListAsync();
                foreach (var course in courses)
                {
                    report.ReportResults.Add(new Course
                    {
                        CourseName = course.CourseName,
                        CourseStatus = course.CourseStatus,
                        StartDate = course.StartDate,
                        EndDate = course.EndDate,
                    });
                }
            }

            else if (selectedReport == "Assessments")
            {
                var assessments = await _db.Table<Assessment>().Where(a => a.TestDate >= DateTime.Today).ToListAsync();
                foreach (var assessment in assessments)
                {
                    report.ReportResults.Add(new Assessment
                    {
                        AssessmentName = assessment.AssessmentName,
                        AssessmentType = assessment.AssessmentType,
                        TestDate = assessment.TestDate,
                    });
                }
            }

            else if (selectedReport == "Homework")
            {
                var homeworks = await _db.Table<Homework>().Where(h => h.DueDate >= DateTime.Today).ToListAsync();
                foreach (var homework in homeworks)
                {
                    report.ReportResults.Add(new Homework
                    {
                        HomeworkName = homework.HomeworkName,
                        HomeworkType = homework.HomeworkType,
                        DueDate = homework.DueDate,
                    });
                }
            }
        }
        #endregion

        #region Sample data
        public static async Task LoadSampleData()
        {
            await Init();

            Term term = new Term
            {
                TermName = "Sample Term 1",
                StartDate = new DateTime(2025, 01, 01),
                EndDate = new DateTime(2025, 06, 30)
            };

            await _db.InsertAsync(term);

            Course course = new Course
            {
                TermId = term.TermId,
                CourseName = "Sample Course 1",
                StartDate = new DateTime(2025, 01, 05),
                EndDate = new DateTime(2025, 02, 05),
                DueDate = new DateTime(2025, 06, 30),
                CourseStatus = "In progress",
                StartNotification = "On",
                EndNotification = "On",
                InstructorName = "Sample Person",
                InstructorPhone = "000-000-0000",
                InstructorEmail = "sample@sample.com"
            };

            await _db.InsertAsync(course);

            Assessment assessment = new Assessment
            {
                CourseId = course.CourseId,
                AssessmentName = "Sample Assessment",
                AssessmentType = "Final", 
                TestDate = new DateTime(2025, 01, 25),
                TestNotification = "On"
            };

            await _db.InsertAsync(assessment);

            Homework homework = new Homework
            {
                CourseId = course.CourseId,
                HomeworkName = "Writing Sample",
                HomeworkType = "Paper",
                DueDate = new DateTime(2025, 02, 05),
                DueDateNotification = "On"
            };

            await _db.InsertAsync(homework);
        }

        public static async Task ClearSampleData()
        {
            await Init();

            await _db.DropTableAsync<Term>();
            await _db.DropTableAsync<Course>();
            await _db.DropTableAsync<Note>();
            await _db.DropTableAsync<Assessment>();
            _db = null;

            Settings.ClearSettings();
        }
        #endregion

        #region Unit test methods
        public static async Task<Term> AddTermAsyncUnitTest(string termName, DateTime startDate, DateTime endDate)
        {
            await Init();

            var term = new Term
            {
                TermName = termName,
                StartDate = startDate,
                EndDate = endDate
            };

            await _db.InsertAsync(term);

            return term;
        }

        public static async Task<Term> UpdateTermAsyncUnitTest(int termId, string termName, DateTime startDate, DateTime endDate)
        {
            await Init();

            var termQuery = await _db.Table<Term>()
                .Where(i => i.TermId == termId)
                .FirstOrDefaultAsync();

            if (termQuery != null)
            {
                termQuery.TermName = termName;
                termQuery.StartDate = startDate;
                termQuery.EndDate = endDate;

                await _db.UpdateAsync(termQuery);

                return termQuery;

            }

            return null;
        }

        #endregion

    }
}
