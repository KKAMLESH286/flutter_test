import 'package:flutter/material.dart';
import 'package:fluttertest/view/home/schedule_screen.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScheduleScreen(),
    );
  }
}
