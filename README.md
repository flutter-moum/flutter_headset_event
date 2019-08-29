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
    HeadsetEvent headsetPlugin = new HeadsetEvent();
    HeadsetState headsetEvent;

    /// if headset is plugged
    headsetPlugin.getCurrentState.then((_val){
      setState(() {
        headsetEvent = _val;
      });
    });

    /// Detect the moment headset is plugged or unplugged
    headsetPlugin.setListener((_val) {
      setState(() {
        headsetEvent = _val;
      });
    });
```