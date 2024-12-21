# Flutter App Setup and Usage Guide

## Prerequisites
Before running the app, make sure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- A device or emulator for mobile testing
- A web browser for testing the web version

## APK Installation (Android)
You can manually install the APK on your Android device.

1. Download the APK from the following directory after building the release:
   - Path: `release\android\app-release.apk`
   
2. Transfer the APK file to your Android device, or use the following command to install it directly from your terminal:
   ```bash 
   adb install release\android\app-release.apk
   ```

3. Once installed, you can open the app from your app drawer.

Note: If you have trouble installing the APK, ensure that the "Install from unknown sources" option is enabled in your Android device settings.

## Running the Web Version
To run the already built web version of the app locally, follow these steps:

1. Locate the Build Folder: The web version of the app is built and ready for use in the release\build\web folder.

2. Serve the Web App Locally:

    - Open the terminal or command prompt.

    - Navigate to the build\web folder:
        ```bash 
        cd path/to/your/project/release/web
        ```

    - You can serve the web app using any local server or simply open the index.html file directly in a browser. For a simple local server, use Python:

    For Python 3.x:

        ```bash
        python -m http.server
        ```

    For Python 2.x:

        ```bash
        python -m SimpleHTTPServer
        ```

    This will start a local server. Open your browser and visit http://localhost:8000.

3. Best Viewing Experience:

    - For the best experience, it is recommended to use a mobile screen resolution or emulate a mobile screen size in your browser. You can do this by inspecting the app in your browser (right-click → Inspect → Toggle Device Toolbar) and selecting a mobile device to simulate.


## App Demo Video
Watch a demo of the app in action: App Demo on YouTube (https://youtube.com/shorts/cIlM1r5-R7Y)

