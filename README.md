[UI](https://github.com/OmarRakaiby/flutter_application/issues/1#issue-3052814913)

# 🌳 Flutter Tree App

A Flutter app to create and view simple posts with images and personal profiles. This application demonstrates:

- Image selection from gallery or camera
- Basic state management using `setState`
- UI customization with widgets like `Stack`, `GridView`, and `CircleAvatar`
- Navigation between screens

---

## ✨ Features

- 📸 Pick multiple images from gallery
- 📷 Capture a profile image via camera
- 📝 Add title and body content for a post
- ❤️ Favorite button toggle
- 📱 Smooth navigation between screens
- 🌄 Seasonal tree image cards
- 🔁 Live preview of selected images

---

## 📲 Screens Overview

### 1. **First Screen**
- Acts as the post creation page
- Supports adding a title, body, and images

### 2. **Profile Page**
- Change, delete, or preview profile photo
- Displays hardcoded name and email

### 3. **Home Page (`MyHomePage`)**
- Displays the created post
- Shows images in grid format (if multiple)
- Includes favorite and share buttons

---

## 🛠️ Getting Started

### Requirements

- Flutter SDK installed
- VS Code or Android Studio
- A physical device or emulator

### Setup

```bash
git clone https://github.com/OmarRakaiby/flutter_application.git
cd flutter_application
flutter pub get
flutter run

