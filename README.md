## Mapsted

## Flutter requirements
You need to follow below documentation for installing flutter sdk 

1. https://docs.flutter.dev/get-started/install


## Installation

1. First, add mapsted_flutter as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  mapsted_flutter:
```

2. Run below command in your project directory in terminal
```yaml
flutter pub get
```

3. Run below command in your project directory in terminal
```bash
dart run mapsted_flutter:create
```


## Platform Specific Configurations

### iOS 

- Project/ios/Podfile Add source file on top.

```sh
source 'https://cdn.cocoapods.org/'

# To run in simulator add below source target
source 'https://github.com/Mapsted/podspec-simulator.git'

# To run in device add below source target
source 'https://github.com/Mapsted/podspec.git'
```

- Project/ios/Podfile set use frameworks in your app target

```sh
use_frameworks!
```

#### IMPORTANT
- Add license file in Resources folder `your_ios_license.key`


### Android

1. Set the `minSdkVersion` in `android/app/build.gradle`:

```groovy
android {
    defaultConfig {
        minSdkVersion 24
    }
}
```

2. Create build-extras.gradle File Create a file named build-extras.gradle in the android/app directory of your project.

```groovy
android {
    packagingOptions {
                        exclude 'META-INF/LICENSE.md'
                        exclude 'META-INF/NOTICE.md'
                        exclude 'META-INF/gradle/incremental.annotation.processors'
                    }
    dataBinding {
        enabled = true
    }
}
```

3. Apply the build-extras.gradle in app/build.gradle

Open your android/app/build.gradle file and add the following code to apply the build-extras.gradle file if it exists:

```groovy
def hasBuildExtras1 = file('build-extras.gradle').exists()
if (hasBuildExtras1) {
    apply from: 'build-extras.gradle'
}
```

4. Set the buildscript Repositories

Update the buildscript section in android/app/build.gradle to include additional repositories:

```groovy
buildscript {
    repositories {
        google()
        mavenCentral()
        maven { url "https://jitpack.io" }
        maven { url "https://mobilesdk.mapsted.com:8443/artifactory/gradle-mapsted" }
    }
}
```
Make sure to save your changes and sync your project with Gradle to apply these configurations.


#### IMPORTANT
- Add license file in Assets folder('/app/src/main/assets') `your_android_license.key`

### Building the Application

To build the application for Android and iOS platforms, follow the instructions below:


1. Building for Android
To build the Android APK, use the following command:
```bash
flutter build apk --split-per-abi
```

2. Building for iOS
To build the iOS application, use the following command:
```bash
flutter build ios
```
- Ensure you have Xcode installed and properly configured before running this command.
- You might need to open the iOS project in Xcode and manage signing and provisioning profiles as needed.

See `example.dart` linked example for more info.