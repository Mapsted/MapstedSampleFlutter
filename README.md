## Mapsted

## Flutter requirements
You need to follow below documentation for installing flutter sdk 

1. https://docs.flutter.dev/get-started/install


## Installation

1. First, add mapsted_flutter as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  mapsted_flutter: <latest_version>
```

Don't forget to flutter pub get.

2. Run below command in your project directory in terminal
```bash
dart run mapsted_flutter:create
```

3. Build android platform
```bash
flutter build apk --split-per-abi
```

4. Build IOS platform
```bash
flutter build ios
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

See `example.dart` linked example for more info.