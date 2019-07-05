import 'dart:async';

import 'package:flutter/services.dart';

typedef DetectPluggedCallback = Function(bool payload);

class HeadsetEvent {

  DetectPluggedCallback detectPluggedCallback;

  static const MethodChannel _channel =
      const MethodChannel('flutter.moum/headset_event');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<bool> get isPlugged async {
    final int state = await _channel.invokeMethod('getCurrentState');
    switch(state) {
      case 0:
        return Future.value(false);
      case 1:
        return Future.value(true);
      case -1:
        return Future.value(false);
    }
    return Future.value(false);
  }

  setOnPlugged(DetectPluggedCallback onPlugged) {
    detectPluggedCallback = onPlugged;
    _channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "plugged":
        return detectPluggedCallback(true);
      case "unplugged":
        return detectPluggedCallback(false);
      default:
        print('No idea');
        return detectPluggedCallback(false);
    }
  }


}
