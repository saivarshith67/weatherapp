import 'package:flutter/material.dart';
import 'colours.dart';

class WeatherDetailsWidget extends StatelessWidget {
  WeatherDetailsWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 550,
      width: 700,

      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: const Border(bottom: BorderSide(width: 2,color: Colors.white)),
            color: ColourPalette().blue.withOpacity(1.0),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                  "Date",
                  style: TextStyle(fontFamily: "InterSemiBold",color: Colors.white, fontSize: 15.0),
              ),
              //Icon
              const SizedBox(height: 230,),
              const Text("Temperature",style: TextStyle(fontFamily: "InterSemiBold",fontWeight: FontWeight.w800,fontSize: 45,color: Colors.white),),
              const SizedBox(height: 20,),
              const Text("Temperature details",style: TextStyle(fontFamily: "InterRegular",fontWeight: FontWeight.w500,fontSize: 25,color: Colors.white),),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Column(
                      children: [
                        Icon(Icons.thermostat,color: Colors.white,size: 35,),
                        SizedBox(height: 6,),
                        Text("Value"),
                        SizedBox(height: 6,),
                        Text("Feels like"),
                      ],
                    ),
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Icon(Icons.water_drop_outlined,color: Colors.white,size: 35,),
                        SizedBox(height: 6,),
                        Text("Value"),
                        SizedBox(height: 6,),
                        Text("Feels like"),
                      ],
                    ),
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Icon(Icons.air,color: Colors.white,size: 35,),
                        SizedBox(height: 6,),
                        Text("Value"),
                        SizedBox(height: 6,),
                        Text("Feels like"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
