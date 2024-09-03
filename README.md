# Moinsen: Cursor Test

## Overview

This project is a Flutter application with the following features and enhancements:

### 1. Refactoring
The codebase has been refactored into three separate files to improve maintainability:
- **`main.dart`**: Contains only the entry point of the application.
- **`app.dart`**: Contains the `MyApp` widget, which sets up the overall app configuration.
- **`home_page.dart`**: Contains the `MyHomePage` widget and its state, representing the main screen of the app.

### 2. Theme Management
- **Dark/Light Mode Toggle**: 
  - Added a toggle action button to the `AppBar` to switch between light and dark mode.
  - The theme state is managed in `MyHomePage` and persisted using `shared_preferences` to ensure the selected theme is remembered across app restarts.
  - The theme management was further enhanced using `Riverpod` for state management.

### 3. Testing
- **Widget Tests**:
  - Fixed errors in the test files and added new tests to verify the functionality of the theme changer button.
  - Updated tests to reflect changes in theme management and state persistence.
  - Added tests to ensure the `ThemeNotifier` correctly toggles and persists the theme state using `shared_preferences`.

### 4. Localization
- **Language Selector**:
  - Added a language selector in the `AppBar` for English, German, Spanish, and French.
  - Used the `flutter_localizations` package for internationalization.
  - Refactored all hardcoded text messages to use localized strings.
  - The current selected language is displayed with its corresponding flag in the `AppBar`.
  - Language selection is persisted using `shared_preferences` and managed via `Riverpod`.

### 5. UI Enhancements
- **Loading Indicator**:
  - Added a centered loading indicator that occupies 25% of the screen while the theme is being loaded.

### 6. App Title
- **Updated App Title**: 
  - The app's title has been updated to "Moinsen: Cursor Test."

### 7. Build Configuration
- **Generated Code**:
  - The project uses `build_runner` to generate necessary code for `Riverpod` providers. 
  - Ensure you run `flutter pub get` and `flutter pub run build_runner build --delete-conflicting-outputs` after cloning the repository or making changes to the providers.

## Running the Project

To run this project, follow these steps:

1. Ensure you have Flutter (version 3.24.x) and Dart (version 3.5.x) installed on your system.

2. Clone the repository:
   ```
   git clone https://github.com/your-username/moinsen-cursor-test.git
   cd moinsen-cursor-test
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Generate necessary code:
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   ```
   flutter run
   ```

   This will launch the app on your connected device or emulator.

6. To run tests:
   ```
   flutter test
   ```

Note: Make sure you have a device connected or an emulator running before step 5.

