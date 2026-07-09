# 🩺 BMI Calculator App

A modern and responsive **BMI Calculator** built using **Flutter**. The application calculates Body Mass Index (BMI), classifies the user's health status, and stores BMI history locally using **SharedPreferences**. State management is implemented with **Riverpod**, following a clean and scalable architecture.
---

## 📱 Features

- 📏 Calculate BMI using height and weight
- 🎯 Automatic BMI classification
  - Underweight
  - Normal
  - Overweight
  - Obese
- 💾 Save BMI history locally
- 📜 View previous BMI calculations
- 🗑️ Clear all history with a confirmation dialog
- ⚡ Reactive state management with Riverpod
- 🎨 Modern Material 3 UI
- 📱 Bottom Navigation (Home & History)
- 🚀 Splash Screen
- 🌐 Works completely offline

---

## 📸 Screenshots

<img width="377" height="651" alt="Screenshot 2026-07-08 013014" src="https://github.com/user-attachments/assets/7fb63554-74d0-4df9-95c8-96b1cd5ccf02" />
<img width="377" height="651" alt="Screenshot 2026-07-07 063643" src="https://github.com/user-attachments/assets/467c95fd-07d3-49fa-8416-d32da7eb79c9" />
<img width="377" height="651" alt="Screenshot 2026-07-08 013031" src="https://github.com/user-attachments/assets/3480fd21-daa3-499e-b9aa-5dd618998132" />
<img width="377" height="651" alt="Screenshot 2026-07-07 063725" src="https://github.com/user-attachments/assets/1000d313-3065-4350-a2b4-3ee9f32ff58e" />


---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform App Development |
| Dart | Programming Language |
| Riverpod | State Management |
| SharedPreferences | Local Storage |
| Material 3 | UI Design |

---

## 📂 Project Structure

```text
lib/
│
├── model/
│   ├── bmi_model.dart
│   └── history_model.dart
│
├── provider/
│   ├── bmi_provider.dart
│   └── history_provider.dart
│
├── services/
│   └── shared_pref_service.dart
│
├── screens/
│   ├── splash_screen.dart
│   ├── main_screen.dart
│   ├── home_screen.dart
│   └── history_screen.dart
│
├── widgets/
│   ├── height_card.dart
│   ├── weight_card.dart
│   ├── result_card.dart
│   ├── calculate_button.dart
│   ├── history_card.dart
│   └── empty_history_card.dart
│
└── main.dart
```

---

## 🧮 BMI Formula

The application calculates BMI using the standard formula:

```text
BMI = Weight (kg) / Height² (m²)
```

### BMI Categories

| BMI Range | Category |
|-----------|----------|
| Below 18.5 | Underweight |
| 18.5 – 24.9 | Normal |
| 25.0 – 29.9 | Overweight |
| 30.0 and above | Obese |

---

## 🏗️ Architecture

The project follows a clean separation of responsibilities.

```text
UI (Screens & Widgets)
        │
        ▼
Riverpod Providers
        │
        ▼
Service Layer
        │
        ▼
SharedPreferences
```

---

## 🚀 Getting Started

### Clone the Repository

```bash
git clone https://github.com/your-username/bmi-calculator.git
```

### Navigate to the Project

```bash
cd bmi-calculator
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

---

## 📦 Dependencies

```yaml
flutter_riverpod:
shared_preferences:
intl:
```

---

## 🎯 Future Improvements

- 🔥 Firebase Authentication
- ☁️ Cloud Firestore Integration
- 📊 BMI Progress Charts
- 🌙 Dark Mode
- 🎞️ Lottie Animations
- 👤 User Profile
- 📅 BMI Analytics
- ❤️ Health Tips & Recommendations

---
