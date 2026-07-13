# Student Attendance App

A modern **Flutter** mobile application that lets students mark their daily attendance using **biometric (fingerprint) authentication**, track attendance history, and apply for leave — all backed by **Firebase**.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?logo=firebase&logoColor=black)
![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

##  Features

- **Authentication** — Secure Email/Password login & registration via Firebase Auth
- **Biometric Attendance** — Mark attendance with fingerprint verification (`local_auth`)
- **Duplicate Prevention** — Prevents marking attendance more than once per day
- **Attendance History** — Real-time attendance records via Firestore streams
- **Leave Management** — Apply, edit, and delete leave requests with date picker
- **Dark / Light Theme** — Toggle app theme instantly using `Provider`
- **Cloud Firestore** — All data synced and stored in real time
- **Clean UI** — Simple, responsive, and beginner-friendly Material Design interface

---

##  Tech Stack

| Category         | Technology                     |
|-------------------|--------------------------------|
| Framework         | Flutter (Dart)                 |
| Backend           | Firebase (Auth + Firestore)    |
| State Management  | Provider                       |
| Biometric Auth    | local_auth                     |
| Architecture      | StatefulWidget / StreamBuilder |

---

## 📂 Project Structure

```
lib/
├── main.dart              # App entry point & Firebase initialization
├── firebase_options.dart  # Auto-generated Firebase configuration
├── login_page.dart        # User login screen
├── register_page.dart     # Student registration screen
├── home_page.dart         # Bottom navigation host (Attendance + Leave)
├── attendance_page.dart   # Mark attendance & view attendance history
├── leave_page.dart        # Apply / edit / delete leave requests
└── theme_provider.dart    # Dark/Light theme state management
```

---

##  Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- [Firebase Project](https://console.firebase.google.com/) with **Authentication** and **Cloud Firestore** enabled
- Android Studio / VS Code with Flutter & Dart plugins
- A physical Android device or emulator with fingerprint support (for biometric testing)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/student-attendance-app.git
   cd student-attendance-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a project in the [Firebase Console](https://console.firebase.google.com/)
   - Enable **Email/Password** sign-in under Authentication
   - Create a **Cloud Firestore** database
   - Install the FlutterFire CLI and generate your own config:
     ```bash
     dart pub global activate flutterfire_cli
     flutterfire configure
     ```
   - This regenerates `lib/firebase_options.dart` with your own project credentials

4. **Run the app**
   ```bash
   flutter run
   ```

> **Note:** Never commit your real `firebase_options.dart` / API keys to a public repository. Add it to `.gitignore` or use environment-specific configs for production apps.

---

## Key Dependencies

```yaml
dependencies:
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
  provider: ^latest
  local_auth: ^latest
```

Run `flutter pub get` after adding/updating these in `pubspec.yaml`.

---

## App Flow

1. **Register/Login** → Student creates an account or logs in
2. **Home** → Bottom navigation between **Attendance** and **Leave Requests**
3. **Attendance** → Tap "Mark Attendance" → authenticate with fingerprint → record saved to Firestore
4. **Leave** → Submit a leave request with reason & date → track, edit, or delete pending requests

---

## Future Improvements

- [ ] Admin/Teacher dashboard for approving leave requests
- [ ] QR-code based attendance as a fallback
- [ ] Push notifications for leave status updates
- [ ] Attendance analytics & monthly reports
- [ ] iOS support with Face ID / Touch ID

---

##  Contributing

Contributions are welcome! Feel free to fork this repo, open issues, or submit pull requests.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


