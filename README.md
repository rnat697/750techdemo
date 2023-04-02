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
I have two example projects in this repository, ```/flutter_new_project_example/``` and ```/flutter_tech_demo/```. The project ```/flutter_new_project_example/``` is the project that Flutter auto-generates. This is a very basic application. The project ```/flutter_tech_demo/``` is my implementation of a Pokedex application using Flutter and the PokeAPI.

Both projects will include the following directories and files in their respective main project folder. Inside this directory you will see a lot of folders. The following directories contain files and folders required for running the application on a given OS:
- ```/android/```
- ```/ios/```
- ```/linux/```
- ```/macos/```
- ```/web/```
- ```/windows/```

Typically you wouldn't need to work in those directories. However, sometimes you may need to modify a file to grant permisson for your app to do certain things such as accessing the internet.

The working directory is under the ```/lib/``` directory. The folder structure in this directory is up to you. Additionally, the file ```pubspec.yaml```  downloads and configures the dependencies or packages that our application would require and ```pubspecam.lock``` contains the version of each dependency/package used in the application. Typically, you would only need to edit the ```pubspec.yaml``` when adding additional dependencies or packages.

### Project 1 Folder: flutter_new_project_example
The Flutter project files for this are located in the ```/flutter_new_project_example/``` directory.
Since this is a very basic application, there is only one file in the working directory ```/lib/``` which is ```main.dart```.

### Project 2 Folder: flutter_tech_demo
The Flutter project files for this are located in the ```./flutter_tech_demo/``` directory. 
For this project, I need to access the internet to fetch pokemon from the pokeAPI. In order to access the internet you need to add the permission ```<uses-permission android:name="android.permission.INTERNET" /> ``` in the ```AndroidManifest.xml``` located in ```/android/app/src/main/``` directory.

The working directory ```/lib/``` for my Flutter tech demo contains:
- ```/data/``` folder - contains ```.dart``` files for data models that I fetched from the PokeAPI.
- ```/pages/``` folder - contains ```.dart``` files that has the application UI layout for a specific pages/screens.
- ```/utils/``` folder - contains a ```styles.dart``` file to centralise my styling for widgets.
- ```/widgets/``` folder - contains ```.dart``` files for custom widgets that could be repeatedly used.
- ```main.dart``` file - this is where the application first gets executed.


## How to use my project (flutter_tech_demo)
This pokedex will show up to 1,000 pokemon. Click on any pokemon on the screen to view further infomation on that pokemon. Information that will be shown are:
- Pokemon's name
- Type(s)
- height
- weight
- desription (placeholder text)

## How to test on desktop browsers
There are two ways to test on desktop browsers, using VSCode for debug mode or using command line for debug mode.
### Using VSCode
The following instructions is using VSCode.
1. Click the bottom right status bar  ![image](https://user-images.githubusercontent.com/79692362/229346678-4e1e636b-ad19-477b-b629-43be766e0868.png) on the select a device (browser) to view the application on.![image](https://user-images.githubusercontent.com/79692362/229346711-9db176bc-d6ae-44b8-bfbf-a7e1da04a9a5.png)

2. Click on Run without debugging or start debugging button.
3. You will see the application run on the specified browser. Additionally, you can use the DevTools provided from the Dart VSCode extension to help you debug. This can be turned on by clicking on the magnifying glass with the Flutter logo. ![image](https://user-images.githubusercontent.com/79692362/229344225-362a215f-b935-4adb-af6c-981f6579e519.png) This will show the Widget Inspector as seen here. ![image](https://user-images.githubusercontent.com/79692362/229344260-cdfc8c9a-1ffe-41a1-ac78-eef13c6908d4.png)

### Using Terminal
The following instructions is using command line debug mode:
1. Type in terminal ```dart devtools``` to open DevTools.
2. Type in a second terminal ```flutter run``` and follow the prompts to choose which browser you want to use or ```flutter run -d chrome``` to specify chrome.
3. Copy and paste the site's address that is shown on the second terminal once the application loads on to the DevTools. This is to connect the application to the DevTools.


## How to test on Android emulators and real Android phones
### Downloading Android Emulators using Android Studio's AVD
The following instructions is on how to download emulators from Android Studio using it's AVD:
1. Open up Android Studio
2. Click on ```Device Manager``` on the right side bar.
![image](https://user-images.githubusercontent.com/79692362/229346013-f963191b-f91c-4417-913d-29bae30dd520.png)
3. Click on ```Create Device``` and chooose a device and then press ```Next```. Note: Only devices that has the Play Store logo will have access to a mobile browser.
4. Download (if you haven't already) an Android API level and choose one and then press ```Next```. Note: Android API Level 31's Chrome browser doesn't work if you selected a device with the Play Store.
5. Verify your configuration and then press ```Finish```.

### Mobile App on emulated Android devices
Here's how to open up the application as an mobile app on emulated Android devices:
1. Click the bottom right status bar ![image](https://user-images.githubusercontent.com/79692362/229346678-4e1e636b-ad19-477b-b629-43be766e0868.png)  on the select a device (mobile emulator) to view the application on. ![image](https://user-images.githubusercontent.com/79692362/229346802-aa7d37a6-9565-48fd-b837-c99b3c990144.png)

2. Click on Run without debugging or start debugging button.
3. You will see the application run on the specified browser. Additionally, you can use the DevTools provided from the Dart VSCode extension to help you debug. This can be turned on by clicking on the magnifying glass with the Flutter logo. ![image](https://user-images.githubusercontent.com/79692362/229344225-362a215f-b935-4adb-af6c-981f6579e519.png) This will show the Widget Inspector as seen here. ![image](https://user-images.githubusercontent.com/79692362/229346988-9198cdec-cab4-4b30-8751-cdfe3231e98a.png)


### Mobile App on real Android devices
The following instructions is to test the application as a mobile app on a real Android device:
1. Enable developer mode on your (Pixel) device by going to ```Settings --> About Device ``` and tap on ```Build Number``` 7 times. Next go to ```System --> Advanced --> Developer Options```. Find ```USB debugging``` and enable it. Note the location of ```Build Number``` and ```Developer Options``` may vary from device to device and you only need to do this once.
2. Connect your mobile device to your laptop using a USB. A pop up on your mobile device should ask you if you want to connect to this computer. You should accept this prompt.
3. On VSCode, your phone should show up on the status bar ![image](https://user-images.githubusercontent.com/79692362/229347181-a7d1f2a7-2ba6-49e3-8d23-9c505e7c32f5.png). If not click on the status bar and choose your device.
4. Click on Run without debugging or start debugging button.
5. You should see your application show up on your phone. DevTools is also available for this method.

### Webserver for mobile browsers (on real and emulated devices)
The following instructions is for hosting a webserver to test on mobile browsers (on both real and emulated devices):
1. Open up your emulated mobile device (if you're going for emulation).
2. Enable developer mode on your (Pixel) device by going to ```Settings --> About Device ``` and tap on ```Build Number``` 7 times. Next go to ```System --> Advanced --> Developer Options```. Find ```USB debugging``` and enable it. Note the location of ```Build Number``` and ```Developer Options``` may vary from device to device and you only need to do this once.
3. Type in the command line ```flutter build web``` for release mode. You can also add ```--web-renderer html``` or ```--web-renderer canvaskit``` to specify a render. Note this step is also valid for viewing on desktop browsers.
4. Type in the command line ```flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080 --release```. This will launch a webserver where you can access the application on any browser (including desktop).
5. Connect your real device to your laptop hosting the webserver using a USB or if emulated skip this step
6. On a separate terminal, type ```adb reverse tcp:8080 tcp:8080``` to expose a port on your Android device to a port on your laptop.
7. On your mobile device, tap on the browser and type in the address that your webserver is serving at. E.g. ```http://localhost:8080```. This will show you the application.

Note: Devtools will not be available on this.

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


