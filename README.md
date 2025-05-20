# 🏢 Vida Work Station

**Vida Work Station** is a Flutter application built for a real co-working space. It allows clients to view the latest news, explore available courses and meeting rooms, and book them easily. The app connects to a REST API for dynamic data and uses local token storage to manage sessions.

---

## ✨ Features

- 🚀 Splash screen on launch
- 🔐 Client registration and login
- 📲 Fully connected to a RESTful API for:
  - News
  - Courses
  - Room availability and bookings
  - Authentication
- 🏠 Home screen with navigation icons to:
  - 📚 Courses (seat-limited, API-based booking)
  - 🏛️ Meeting room booking (with date, time, and attendee count)
  - 📰 News and updates from the workspace
- 💬 Built-in chat system for client support
- 🎨 Business-style UI with modern layout

---

## 📱 Screenshots
![Splash Screen](https://github.com/user-attachments/assets/701bd3b9-4dca-4b8f-aa4a-08134d12077b)
![Login Screen](https://github.com/user-attachments/assets/70db65f3-2ba2-4ee6-972a-233de17e71a9)
![Singup Screen](https://github.com/user-attachments/assets/725f8a7b-119e-4563-9db1-30908d605a74)
![Home Screen](https://github.com/user-attachments/assets/a88ec79c-c2da-4d4b-9ad6-ab64008d77bc)
![Screenshot_1747775929](https://github.com/user-attachments/assets/7c80f1d4-23b3-41dd-9ff4-f4198057813a)
![Screenshot_1747776482](https://github.com/user-attachments/assets/84f0d81c-6365-4db1-8bed-4110b16998ca)
![Screenshot_1747776139](https://github.com/user-attachments/assets/77b73b84-e605-4271-a88d-8e26d6017947)
![Screenshot_1747775982](https://github.com/user-attachments/assets/80b07165-6aa0-49cc-92fb-d5d0d568dc6c)
![Screenshot_1747775988](https://github.com/user-attachments/assets/8fa2c6c0-3800-4a6b-b56a-bab5fc4428ba)
![Screenshot_1747776006](https://github.com/user-attachments/assets/e2dcbb6c-f8db-45f9-b3d4-c1ce5882a493)



---

## 🚀 Getting Started

To run the app locally:

```bash
git clone https://github.com/abdallahalqisy/Vida-Work-Station.git
cd Vida-Work-Station
flutter pub get
flutter run
```

---

## 🛠️ Tech Stack

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- **REST API** (for authentication, course & room data, bookings, news)
- Cubit for state management (from flutter_bloc package)
- `shared_preferences` (for storing user authentication token)
- Modular structure (Login, Register, Home, Courses, Rooms, News, Chat)

---

## 👤 User Roles

- The app is built for **clients only**
- Each client can:
  - Sign up and log in
  - Book courses (limited seats)
  - Book meeting rooms (based on time, date, and size)
  - Read news
  - Chat with workspace support

---

## 🚫 Not Included (Yet)

- ❌ Push notifications
- ❌ Location/map integration

---

## 📄 License

This app was created exclusively for **Vida Work Station**. All rights reserved.

---

## 📬 Contact

For questions or contributions:  
📧 alqisyabdallah@gmail.com  
📱 WhatsApp: 01553212429  
🌐 [Facebook](https://www.facebook.com/abdallah.alqisy.7)
