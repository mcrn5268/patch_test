# Flutter Project

## Description
This is a Flutter application for managing products and categories. It supports both mobile and web platforms.

## Prerequisites
- Flutter SDK (Ensure you have Flutter 2.x or above installed).
- Android Studio, Visual Studio Code, or another IDE with Flutter support.
- Chrome browser (for web support).

## Setup Instructions

### Clone the Repository
1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repository-name
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

### Running the App on Android (Mobile)
1. Connect your Android device or start an Android emulator.
2. To build and run the app in release mode, run the following command:

    ```bash
    flutter build apk --release
    ```

3. Install the APK on your device:

    ```bash
    flutter install
    ```

4. Alternatively, you can manually install the APK on your device.

### Running the App on Web (Localhost)
1. Ensure you have a web environment set up by following the Flutter [web installation guide](https://flutter.dev/docs/get-started/web).
2. To run the app on your local machine using Chrome, execute:

    ```bash
    flutter run -d chrome
    ```

3. The app will be served at `http://localhost:8000/`.

### Building for Web (Production)
1. To build the app for web production:

    ```bash
    flutter build web
    ```

2. The production files will be in the `build/web` directory. You can deploy these files to a web server.

