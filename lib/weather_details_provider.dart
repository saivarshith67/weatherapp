import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/location_details.dart';
import 'daily_weather_services.dart';
import 'hourly_weather_services.dart';

class WeatherDetailsProvider extends ChangeNotifier {
  Position? position;
  double? latitude = 0.0;
  double? longitude = 0.0;
  BuildContext context;
  bool isLoading = false;

  WeatherDetailsProvider({required this.context});

  //Daily Weather Variables
  double tempMax = 0.0;
  double tempMin = 0.0;
  int precipitationProbabilityDaily = 0;
  double windSpeed = 0;

  //Hourly Weather Variables
  List<String> time = ['time'];
  List<double> precipitationProbability = [0.0];
  List<double> temperature = [0.0];

  Map<String, dynamic> mapDaily = {
    'time': <String>[],
    'weatherCode': <int>[],
    'temperature2mMax': <double>[],
    'temperature2mMin': <double>[],
    'uvIndexMax': <double>[],
    'uvIndexClearSkyMax': <double>[],
    'precipitationHours': <double>[],
    'precipitationProbabilityMax': <int>[],
    'windSpeed10mMax': <double>[],
  };

  Map<String, dynamic> mapHourly = {
    'time': <String>[],
    'temperature': <double>[],
    'relativeHumidity': <int>[],
    'precipitationProbability': <int>[],
    'rain': <double>[],
    'weatherCode': <int>[],
    'isDay': <int>[],
  };

  Future<void> fetchLocationDetails(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    position = await DeterminePosition().determinePosition(context);
    latitude = position?.latitude;
    longitude = position?.longitude;

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDailyWeatherData() async {
    isLoading = true;
    notifyListeners();

    mapDaily =
        await DailyWeatherServices(latitude: latitude, longitude: longitude)
            .fetchDailyWeatherDetails();

    isLoading = false;
    notifyListeners();

    tempMax = mapDaily['temperature2mMax']?[0];
    tempMin = mapDaily['temperature2mMin']?[0];
    precipitationProbabilityDaily = mapDaily['precipitationProbabilityMax']?[0];
    windSpeed = mapDaily['windSpeed10mMax']?[0];
    notifyListeners();

  }

  Future<void> fetchHourlyWeatherData() async {
    isLoading = true;
    notifyListeners();

    mapHourly =
        await HourlyWeatherServices(longitude: longitude, latitude: latitude)
            .fetchHourlyWeatherDetails();




    isLoading = false;
    notifyListeners();

    time = mapHourly['time'];
    for (int i = 0; i < time.length; i++) {
      time[i] = time[i].substring(11, 16);
    }
    precipitationProbability = mapHourly['precipitationProbability'];
    temperature = mapHourly['temperature'];

    notifyListeners();
  }
}
