import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/widgets/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Latest Launch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade900,
      ),
      home: MainScreen(),
    );
  }
}
