import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/hourly_weather_services.dart';
import 'package:weatherapp/location_details.dart';
import 'package:weatherapp/weather_details_provider.dart';

class HourlyWeatherDetailsWidget extends StatefulWidget {
  final int index;

  const HourlyWeatherDetailsWidget({super.key, required this.index});

  @override
  State<HourlyWeatherDetailsWidget> createState() =>
      _HourlyWeatherDetailsWidgetState();
}

class _HourlyWeatherDetailsWidgetState
    extends State<HourlyWeatherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherDetailsProvider>(context);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.temperature[0].toString())));
    return Consumer<WeatherDetailsProvider>(
      builder: (context, hourlyWeatherDetails, index) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(hourlyWeatherDetails.mapHourly['time'][widget.index].toString()),
            const SizedBox(
              height: 15,
            ),
            Text(hourlyWeatherDetails.mapHourly['temperature'][widget.index].toString()),
            const SizedBox(
              height: 15,
            ),
            Text(hourlyWeatherDetails.mapHourly['precipitationProbability'][widget.index]
                .toString()),
          ],
        ),
      ),
    );
  }
}
