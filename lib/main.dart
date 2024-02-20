import 'package:flutter/material.dart';
import 'package:weatherapp/colours.dart';
import 'package:weatherapp/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColourPalette().blue),
        useMaterial3: true,
        fontFamily: 'InterRegular'
      ),
      home:  MyHomePage(),
    );
  }
}

