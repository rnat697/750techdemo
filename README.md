# Tech Demo - Flutter
## Installations
**Please use Windows on your PC, Visual Studio Code as your IDE and Android emulators/phones if you are cloning this repo.**
### Required installations for this repo
- Flutter SDK ([Windows](https://docs.flutter.dev/get-started/install/windows))
- Visual Studio Code ([Windows](https://code.visualstudio.com/))
- Visual Studio Code extension for Flutter and Dart
- Android Studio ([Windows](https://developer.android.com/studio)) for emulator downloads using Android Virtual Device (AVD)

### Environment Variables Path Setup
Two environment varibles are needed to be set up:
- Flutter SDK
- Android Debugging Bridge (ADB) for viewing the application on Android phones (real and emulated) via the mobile browser.

The environment variable path for Flutter SDK needs to be set to ```...\flutter_windows_3.7.8-stable\flutter\bin``` where ```...``` is where you downloaded the SDK.

The environment variable path for ADB needs to be set to ```C:\Users\{username}\AppData\Local\Android\Sdk\platform-tools```.


### Flutter Supported IDEs
Flutter has 4 supported IDEs if you wish to use.
- [Visual Studio Code](https://docs.flutter.dev/get-started/editor?tab=vscode)
- [Android Studio](https://docs.flutter.dev/get-started/editor?tab=androidstudio)
- [IntelliJ IDEA](https://docs.flutter.dev/get-started/editor?tab=androidstudio)
- [Emacs](https://docs.flutter.dev/get-started/editor?tab=emacs)

## How to create a new Flutter Project using VSCode
Here are some steps to create a new Flutter project on Visual Studio Code:
1. Press ```Ctrl + Shift + P ``` to open the command palette.
2. Select ``` Flutter: New project ``` command and press ```Enter```.
3. Select ```Application``` and press ```Enter```. This will generate a basic Flutter application with comments to introduce you to the Flutter/Dart syntax.
4. Choose a project location.
5. Enter a project name.

## Folder Structure
The main Flutter project files are located in the ```./flutter_tech_demo/``` directory. Inside this directory you will see a lot of folders. The following directories contain files and folders required for running the application on a given OS:
- ```/android/```
- ```/ios/```
- ```/linux/```
- ```/macos/```
- ```/web/```
- ```/windows/```

Typically you wouldn't need to work in those directories. However, sometimes you may need to modify a file to grant permisson for your app to do certain things such as accessing the internet. For example, on Android, in order to access the internet you need to add the permission ```<uses-permission android:name="android.permission.INTERNET" /> ``` in the ```AndroidManifest.xml``` located in ```/android/app/src/main/``` directory.

The working directory is under the ```/lib/``` directory. The folder structure in this directory is up to you. Additionally, the file ```pubspec.yaml```  downloads and configures the dependecies or packages that our application would require and ```pubspecam.lock``` contains the version of each depedency/package used in the application. Typically, you would only need to edit the ```pubspec.yaml``` when adding additional dependecies or packages.

The working directory ```/lib/``` for my Flutter tech demo contains:
- ```/data/``` folder - contains ```.dart``` files for data models that I fetched from the PokeAPI.
- ```/pages/``` folder - contains ```.dart``` files that has the application UI layout for a specific pages/screens.
- ```/utils/``` folder - contains a ```styles.dart``` file to centralise my styling for widgets.
- ```/widgets/``` folder - contains ```.dart``` files for custom widgets that could be repeatedly used.
- ```main.dart``` file - this is where the application first gets executed.

## How to use my project


## How to test on desktop browsers


## How to test on Android emulators and real Android phones


## Official Flutter documentation / resources
- [Installation of Flutter for Windows](https://docs.flutter.dev/get-started/install/windows)
- [Flutter using Visual Studio Code](https://docs.flutter.dev/development/tools/vs-code)
- [Widgets catalog](https://docs.flutter.dev/development/ui/widgets)
- [Debugging tools](https://docs.flutter.dev/testing/debugging)
- [Build and release to web](https://docs.flutter.dev/deployment/web)
- [Build and release to Android](https://docs.flutter.dev/deployment/android)
- Flutter API - [Material Library](https://api.flutter.dev/flutter/material/material-library.html)
- Flutter API - [Cuperino Library](https://api.flutter.dev/flutter/cupertino/cupertino-library.html)

## References
- [PokeAPI](https://pokeapi.co/docs/v2#info)


