import 'dart:async';

import 'package:flutter/services.dart';

class HeadsetEvent {
  static const MethodChannel _channel =
      const MethodChannel('headset_event');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
