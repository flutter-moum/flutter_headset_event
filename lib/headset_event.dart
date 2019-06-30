import 'dart:async';

import 'package:flutter/services.dart';

typedef DetectPluggedCallback = Future<dynamic> Function(String payload);

class HeadsetEvent {
  static const MethodChannel _channel =
      const MethodChannel('flutter.moum/headset_event');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static initDetectHandler() {
    print('initDetectHandler');
    _channel.setMethodCallHandler(_handleMethod);
  }

  static Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "plugged":
        print('headset plugged!!');
        return new Future.value(true);
      case "unplugged":
        print('headset unplugged!!');
        return new Future.value(false);
    }
  }


}
