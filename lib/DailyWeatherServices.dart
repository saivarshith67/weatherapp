import 'package:http/http.dart' as http;
import 'dart:convert';

class DailyWeatherData {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;
  final List<double> uvIndexMax;
  final List<double> uvIndexClearSkyMax;
  final List<double> precipitationHours;
  final List<double> precipitationProbabilityMax;
  final List<double> windSpeed10mMax;

  const DailyWeatherData({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.uvIndexMax,
    required this.uvIndexClearSkyMax,
    required this.precipitationHours,
    required this.precipitationProbabilityMax,
    required this.windSpeed10mMax,
  });

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {


    final List<String> time = (json['daily']['time'] as List).cast<String>();
    final List<int> weatherCode = (json['daily']['weather_code'] as List).cast<int>();
    final List<double> temperature2mMax = (json['daily']['temperature_2m_max'] as List).cast<double>();
    final List<double> temperature2mMin = (json['daily']['temperature_2m_min'] as List).cast<double>();
    final List<double> uvIndexMax = (json['daily']['uv_index_max'] as List).cast<double>();
    final List<double> uvIndexClearSkyMax = (json['daily']['uv_index_clear_sky_max'] as List).cast<double>();
    final List<double> precipitationHours = (json['daily']['precipitation_hours'] as List).cast<double>();
    final List<double> precipitationProbabilityMax = (json['daily']['precipitation_probability_max'] as List).cast<double>();
    final List<double> windSpeed10mMax = (json['daily']['wind_speed_10m_max'] as List).cast<double>();

    return DailyWeatherData(
      time: time,
      weatherCode: weatherCode,
      temperature2mMax: temperature2mMax,
      temperature2mMin: temperature2mMin,
      uvIndexMax: uvIndexMax,
      uvIndexClearSkyMax: uvIndexClearSkyMax,
      precipitationHours: precipitationHours,
      precipitationProbabilityMax: precipitationProbabilityMax,
      windSpeed10mMax: windSpeed10mMax,
    );
  }
}

class DailyWeatherServices{
  final double? latitude;
  final double? longitude;

  DailyWeatherServices({required this.latitude, required this.longitude});

  Future<Map<String, dynamic>> fetchDailyWeatherDetails() async {
    String requrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,rain,weather_code,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,uv_index_clear_sky_max,precipitation_hours,precipitation_probability_max,wind_speed_10m_max&timezone=auto&forecast_days=3&forecast_hours=24";
    final url = Uri.parse(requrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> map = {
        'time' : <String>[],
        'weatherCode' : <int>[],
        'temperature2mMax' : <double>[],
        'temperature2mMin' : <double>[],
        'uvIndexMax' : <double>[],
        'uvIndexClearSkyMax' : <double>[],
        'precipitationHours' : <double>[],
        'precipitationProbabilityMax' : <int>[],
        'windSpeed10mMax' : <double>[],
      };

      map['time'] = DailyWeatherData.fromJson(data).time;
      map['weatherCode'] = DailyWeatherData.fromJson(data).weatherCode;
      map['temperature2mMax'] = DailyWeatherData.fromJson(data).temperature2mMax;
      map['temperature2mMin'] = DailyWeatherData.fromJson(data).temperature2mMin;
      map['uvIndexMax'] = DailyWeatherData.fromJson(data).uvIndexMax;
      map['uvIndexClearSkyMax'] = DailyWeatherData.fromJson(data).uvIndexClearSkyMax;
      map['precipitationHours'] = DailyWeatherData.fromJson(data).precipitationHours;
      map['precipitationProbabilityMax'] = DailyWeatherData.fromJson(data).precipitationProbabilityMax;
      map['windSpeed10mMax'] = DailyWeatherData.fromJson(data).windSpeed10mMax;

      print(map);


      return map;
    } else {
      throw Exception("Failed to Fetch data ${response.statusCode}");
    }
  }
}

