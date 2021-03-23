import 'package:flutter/material.dart';
import 'package:flutter_sample_navigation/constants/app_constants.dart';
import 'package:flutter_sample_navigation/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kApplicationName,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}
