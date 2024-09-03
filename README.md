# Moinsen: Cursor Test

## Overview

This project is a Flutter application that has undergone significant refactoring and enhancements. Below is a summary of the key changes and features added:

### 1. Refactoring
- **Separation of Concerns:** The original code was refactored into three separate files:
  - `main.dart`: Contains the entry point of the application.
  - `app.dart`: Contains the `MyApp` widget which sets up the overall app configuration.
  - `home_page.dart`: Contains the `MyHomePage` widget representing the main screen of the app.

### 2. Theme Management
- **Dark/Light Mode Toggle:** 
  - A toggle button was added to the `AppBar` to switch between light and dark mode.
  - Theme state management was initially handled in `MyApp` but later moved to `MyHomePage`.
  - Persisted theme state using `shared_preferences` so that the selected theme is remembered across app restarts.
  - The theme management was refactored to use `Riverpod` for better state management and handling of `shared_preferences`.

### 3. Localization
- **Language Selector:**
  - Added a language selector in the `AppBar` for English, German, Spanish, and French.
  - Used the `flutter_localizations` package for internationalization.
  - Refactored the app to remove all hardcoded text and replace them with localized strings.
  - Language state is managed using `Riverpod`.

### 4. Testing
- **Widget Tests:**
  - Fixed existing errors in the test files.
  - Added tests to verify the functionality of the theme changer button.
  - Updated tests to reflect the migration to `Riverpod` and the use of `shared_preferences`.
  - Added tests to ensure that the `ThemeNotifier` correctly toggles and persists the theme state.
  - Included tests for the language provider to ensure that the language selection persists and correctly updates the UI.

### 5. UI Enhancements
- **Loading Indicator:** 
  - Added a centered loading indicator that occupies 25% of the screen while the theme is being loaded.

### 6. App Title
- **Updated App Title:** 
  - The app's title was updated to "Moinsen: Cursor Test."

### 7. Build Configuration
- **Generated Code:** 
  - The project uses `build_runner` to generate necessary code for `Riverpod` providers.
  - Ensure you run `flutter pub get` and `flutter pub run build_runner build --delete-conflicting-outputs` after cloning the repository or making changes to the providers.

## Running the Project

To get started with the project, follow these steps:

1. **Install Dependencies:**
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter run
   ```

2. **Run Tests:**
   ```bash
   flutter test
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```
   