import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/colours_and_text_styles.dart';
import 'package:weatherapp/home_page.dart';


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
          fontFamily: 'InterRegular'),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
