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
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    HeadsetEvent he = new HeadsetEvent();
    he.initialize(onConnected: (_val) {
      setState(() {
        isConnected = _val;
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
          child: Text('Headset is connected? : $isConnected\n'),
        ),
      ),
    );
  }
}
