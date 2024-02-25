import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/hourly_weather_services.dart';
import 'package:weatherapp/location_details.dart';

class HourlyWeatherDetailsWidget extends StatefulWidget {
  final int index;

  const HourlyWeatherDetailsWidget({super.key, required this.index});

  @override
  State<HourlyWeatherDetailsWidget> createState() =>
      _HourlyWeatherDetailsWidgetState();
}

class _HourlyWeatherDetailsWidgetState extends State<HourlyWeatherDetailsWidget> {
  String time = "time";
  double temperature = 0.0;
  int precipitationProbability = 0;
  double? latitude = 0;
  double? longitude = 0;
  Position? position;
  int reqIndex = 0;
  var map = {};

  @override
  void initState(){
    super.initState();
    _callWeatherAPI(context);
    _fetchHourlyWeatherData();
    setState(() {});
  }

  _callWeatherAPI(BuildContext context) async
  {
    position = await DeterminePosition().determinePosition(context);
    latitude = position?.latitude;
    longitude = position?.longitude;
    map = await HourlyWeatherServices(longitude: longitude,latitude: latitude).fetchHourlyWeatherDetails();
  }

  _fetchHourlyWeatherData() async {

    reqIndex = widget.index;

    print("Hourly Weather Details");
    print(map);

    time = map['time']?[reqIndex];
    precipitationProbability = map['precipitationProbability']?[reqIndex];
    temperature = map['temperature']?[reqIndex];





  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(time),
          const SizedBox(height: 15,),
          Text(precipitationProbability.toString()),
          const SizedBox(height: 15,),
          Text(temperature.toString()),
        ],
      ),
    );
  }
}