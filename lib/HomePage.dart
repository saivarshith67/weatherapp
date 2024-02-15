import 'package:flutter/material.dart';
import 'package:weatherapp/colours.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ColourPalette colourPalette = ColourPalette();
  Color colourScheme = Color(0x00000000);

  int temperatureInCelsius = 40;


  Card weatherDetails()
  {
    return  Card(
      color: colourScheme,
      child: const Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                  "City Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'InterSemiBold',
                    fontSize: 25
                  ),


              )
            ],)),
    );
  }

  Card weekForecast(int index)
  {
    return Card(
      color: Colors.black,
      child: Center(child: Text("$index"), ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPalette.lightBlue.withOpacity(1.0),
      appBar: AppBar(
        backgroundColor: colourScheme,
      ),

    );
  }
}
