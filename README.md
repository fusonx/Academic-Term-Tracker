# Academic Term Tracker
Developed a cross-platform mobile application for tracking academic terms, courses, and assessments. Integrated local database management, notifications, and milestone tracking to help students stay organized and on schedule.

## 📌 Features  
✅ Track academic terms, courses, and assessments.

✅ Store data locally with an embedded database (SQLite).

✅ Receive notifications for upcoming assessments.

✅ Cross-platform support for Android, iOS, Windows, and macOS.


## 🚀 Technologies Used 
**Framework:** .NET MAUI

**Language:** C#

**Database:** SQLite with Entity Framework Core

**Notifications:** Local notifications API

**Navigation:** Shell Navigation

## 🛠️ Installation & Setup  
### **Prerequisites**  
Install [Git](https://git-scm.com/)

Install [Visual Studio 2022](https://visualstudio.microsoft.com/vs/)

Install [.NET 7/8 SDK](https://dotnet.microsoft.com/)

Install [MySQL Server](https://www.mysql.com/)

### **Clone the Repository**  
```sh
git clone https://github.com/fusonx/academic-term-tracker.git
cd academic-term-tracker
```

### **Run the Application**
**For Android/iOS**
```sh
dotnet build
dotnet maui run android
# or
dotnet maui run ios
```
*(Ensure your device/emulator is running.)*

**For Windows/macOS**
```sh
dotnet build
dotnet maui run windows
# or
dotnet maui run macos
```
