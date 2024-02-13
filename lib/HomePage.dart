import 'package:flutter/material.dart';
import 'package:weatherapp/colors.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ColorPalette colorPalette = ColorPalette();




  Card weatherDetails()
  {
    return  Card(
      color: colorPalette.blue.withOpacity(1.0),
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

  Card weekForcast(int index)
  {
    return Card(
      child: Center(child: Text("$index"), ),
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPalette.lightBlue.withOpacity(1.0),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                weatherDetails(),

                SizedBox(height: 15,),


              ],
            )
          ),
        )

    );
  }
}
