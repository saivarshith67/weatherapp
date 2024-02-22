import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/FrostedGlassWidget.dart';
import 'package:weatherapp/WeatherDetailsWidget.dart';
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
        leading: TextButton(child: Icon(Icons.more_vert_rounded,color: Colors.white), onPressed: () {print("Hello World");},),

        centerTitle: true,
      ),
      backgroundColor: ColourPalette().lightBlue.withOpacity(1.0),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WeatherDetailsWidget(),
          const SizedBox(height: 30,),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FrostedGlassWidget(),
                )
            ),
          )

        ],
      ),

    );
  }
}
