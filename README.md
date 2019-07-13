# Headset Event Flutter Plugin

A Flutter plugin to get a headset event.

Migrated to AndroidX

## Usage
To use this plugin, add `headset_event` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Android Integration

You need to add receiver in your AndroidManifest.xml

```xml
<application
    ... >

    <receiver android:name="flutter.moum.headset_event.HeadsetBroadcastReceiver" >
        <intent-filter>
            <action android:name="android.intent.action.HEADSET_PLUG" />
            <action android:name="android.intent.action.MEDIA_BUTTON" />
        </intent-filter>
    </receiver>

</application>
```

### Example

``` dart
// Import package
import 'package:headset_event/headset_event.dart';

// Instantiate it
HeadsetEvent he = new HeadsetEvent();
bool isConnected = false;

// Get the value
// if headset is plugged at the moment
he.isPlugged.then((_val){
  setState(() {
    isConnected = _val;
  });
});

// detect if headset plugged or unplugged
he.setOnPlugged((_val) {
  setState(() {
    isConnected = _val;
  });
});
```