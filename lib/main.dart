import 'package:bmi_app/home_screen.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
          canvasColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            displayMedium: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
            bodySmall: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            labelSmall: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            displayLarge: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w800, color: Colors.white),
            displaySmall: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      home: const MyHomePage(title: 'Body Mass Index'),
    );
  }
}
