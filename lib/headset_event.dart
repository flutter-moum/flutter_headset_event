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

  initialize({DetectPluggedCallback onConnected}) {
    detectPluggedCallback = onConnected;
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
