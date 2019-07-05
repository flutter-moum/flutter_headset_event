# Headset Event Flutter Plugin

A Flutter plugin to get a headset event.

Migrated to AndroidX

## Usage
To use this plugin, add `headset_event` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
// Import package
import 'package:headset_event/headset_event.dart';

// Instantiate it
HeadsetEvent he = new HeadsetEvent();
bool isConnected = false;

// Get the value
// if headset is plugged
he.isPlugged.then((_val){
  setState(() {
    isConnected = _val;
  });
});

// detect headset plugged
he.setOnPlugged((_val) {
  setState(() {
    isConnected = _val;
  });
});
```