import 'package:flutter/material.dart';
import 'package:weatherapp/colours.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColourPalette().blue.withOpacity(1),
        title: const  Text(
          "City Name",
          style: TextStyle(
            fontFamily: "InterSemibold",
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),

    );
  }
}
