import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/GetCurrentWeatherDetails.dart';
import 'LocationDetails.dart';
import 'coloursAndStyles.dart';

class WeatherDetailsWidget extends StatefulWidget {
  final BuildContext context;
  WeatherDetailsWidget({super.key, required this.context});

  @override
  State<WeatherDetailsWidget> createState() => _WeatherDetailsWidgetState();
}

class _WeatherDetailsWidgetState extends State<WeatherDetailsWidget> {
  double temp = 0;
  double feelsLike = 0;
  double humidity = 0;
  double windSpeed = 0;
  String description = "";
  Position? position;


  @override
  void initState(){
    super.initState();
    _fetchWeatherData(context);
  }

  _fetchWeatherData(BuildContext context) async {
    // Make your API call, or other actions to fetch data
    // Update the state variables with the fetched data
    // position = DeterminePosition().determinePosition(context)
    // CurrentWeatherServices().fetchCurrentWeatherDetails();
    setState(() {
      // Update state to trigger a rebuild
    });
  }


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
                    child: Column(
                      children: [
                        const Icon(Icons.thermostat,color: Colors.white,size: 35,),
                        const SizedBox(height: 6,),
                        Text("$feelsLike", style: const TextStyle(fontFamily: "InterRegular",color: Colors.white, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 6,),
                        const Text("Feels like", style: TextStyle(fontFamily: "InterRegular",color: Colors.white, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Icon(Icons.water_drop_outlined,color: Colors.white,size: 35,),
                        const SizedBox(height: 6,),
                        Text("$windSpeed"),
                        const SizedBox(height: 6,),
                        const Text("Feels like"),
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
