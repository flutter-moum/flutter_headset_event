import 'dart:async';

import 'package:flutter/services.dart';

typedef DetectPluggedCallback = Function(HeadsetState payload);

enum HeadsetState {
  CONNECT,
  DISCONNECT,
  NEXT,
  PREV,
}

class HeadsetEvent {

  DetectPluggedCallback detectPluggedCallback;

  static const MethodChannel _channel =
      const MethodChannel('flutter.moum/headset_event');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<bool> get isConnected async {
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

  setHeadsetEvent(DetectPluggedCallback onPlugged) {
    detectPluggedCallback = onPlugged;
    _channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "connect":
        return detectPluggedCallback(HeadsetState.CONNECT);
      case "disconnect":
        return detectPluggedCallback(HeadsetState.DISCONNECT);
      case "nextButton":
        return detectPluggedCallback(HeadsetState.NEXT);
      case "prevButton":
        return detectPluggedCallback(HeadsetState.PREV);
      default:
        print('No idea');
        return detectPluggedCallback(HeadsetState.DISCONNECT);
    }
  }


}
