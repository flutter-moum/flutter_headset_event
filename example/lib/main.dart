import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:headset_event/headset_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HeadsetEvent he = new HeadsetEvent();
  var headsetEvent;

  @override
  void initState() {
    super.initState();

    // if headset is plugged
    he.isConnected.then((_val){
      setState(() {
        headsetEvent = _val;
      });
    });

    // detect headset plugged
    he.setHeadsetEvent((_val) {
      setState(() {
        headsetEvent = _val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Headset is connected? : $headsetEvent\n'),
        ),
      ),
    );
  }
}
