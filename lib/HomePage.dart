import 'dart:ui';

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
        leading: TextButton(child: Icon(Icons.menu_sharp,color: Colors.white), onPressed: () {print("Hello World");},),

        centerTitle: true,
      ),
      body: Stack(
        children: [

          Container(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColourPalette().lightBlue.withOpacity(1)
                    ),),),),
          ),

        ],
      )

    );
  }
}
