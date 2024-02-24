import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/DailyWeatherServices.dart';
import 'package:weatherapp/GetCurrentWeatherDetails.dart';
import 'LocationDetails.dart';
import 'coloursAndStyles.dart';
import 'dart:math';

class WeatherDetailsWidget extends StatefulWidget {
  final BuildContext context;
  const WeatherDetailsWidget({super.key, required this.context});

  @override
  State<WeatherDetailsWidget> createState() => _WeatherDetailsWidgetState();
}

class _WeatherDetailsWidgetState extends State<WeatherDetailsWidget> {
  String time = "";
  double tempMax = 0;
  double tempMin = 0;
  double precipitationProbability = 0;
  double windSpeed = 0;
  String description = "";
  Position? position;
  double? latitude = 0;
  double? longitude = 0;
  Map<String,dynamic> map = {};

  // _WeatherDetailsWidgetState({required this.context});




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
    position = await DeterminePosition().determinePosition(context);
    latitude = position?.latitude;
    longitude = position?.longitude;
    latitude = 10.732;
    longitude = 79.0151;
    map = await DailyWeatherServices(latitude: latitude,longitude: longitude).fetchDailyWeatherDetails();

    tempMax = map['temperature2mMax']?[0];
    tempMin = map['temperature2mMin']?[0];
    precipitationProbability = map['precipitationProbabilityMax']?[0];
    windSpeed = map['windSpeed10mMax']?[0];





    setState(() {
      // Update state to trigger a rebuild
    });
  }


  @override
  Widget build(BuildContext context) {
    // print("Build method called\n\n\n\n\n\n\n\n");
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return  SizedBox(
      height: height * 0.65,
      width: width,

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
              Text(
                  "$time",
                  style: TextStyle(fontFamily: "InterSemiBold",color: Colors.white, fontSize: 15.0),
              ),
              //Icon
              const SizedBox(height: 230,),
              Text("$tempMax°C",style: HeadingStyle().toTextStyle(),),
              const SizedBox(height: 20,),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        const Icon(Icons.thermostat,color: Colors.white,size: 35,),
                        const SizedBox(height: 6,),
                        Text("$tempMin°C", style:  RegularStyle().toTextStyle(),),
                        const SizedBox(height: 6,),
                        Text("Temp min.", style: RegularStyle().toTextStyle(),),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Icon(Icons.water_drop_outlined,color: Colors.white,size: 35,),
                        const SizedBox(height: 6,),
                        Text("$precipitationProbability%", style: RegularStyle().toTextStyle(),),
                        const SizedBox(height: 6,),
                        Text("Rain", style: RegularStyle().toTextStyle(),),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Icon(Icons.air,color: Colors.white,size: 35,),
                        const SizedBox(height: 6,),
                        Text("$windSpeed", style: RegularStyle().toTextStyle(),),
                        const SizedBox(height: 6,),
                        Text("Wind", style: RegularStyle().toTextStyle(),),
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
