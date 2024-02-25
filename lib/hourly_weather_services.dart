import 'package:http/http.dart' as http;
import 'dart:convert';

class HourlyWeatherData {
  final List<String> time;
  final List<double> temperature;
  final List<int> relativeHumidity;
  final List<int> precipitationProbability;
  final List<double> rain;
  final List<int> weatherCode;
  final List<int> isDay;

  HourlyWeatherData(
      {required this.time,
      required this.temperature,
      required this.relativeHumidity,
      required this.precipitationProbability,
      required this.rain,
      required this.weatherCode,
      required this.isDay});

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
    final List<String> time = (json['hourly']['time'] as List).cast<String>();
    final List<double> temperature =
        (json['hourly']['temperature_2m'] as List).cast<double>();
    final List<int> relativeHumidity =
        (json['hourly']['relative_humidity_2m'] as List).cast<int>();
    final List<int> precipitationProbability =
        (json['hourly']['precipitation_probability'] as List).cast<int>();
    final List<double> rain = (json['hourly']['rain'] as List).cast<double>();
    final List<int> weatherCode =
        (json['hourly']['weather_code'] as List).cast<int>();
    final List<int> isDay = (json['hourly']['is_day'] as List).cast<int>();

    return HourlyWeatherData(
        time: time,
        temperature: temperature,
        relativeHumidity: relativeHumidity,
        precipitationProbability: precipitationProbability,
        rain: rain,
        weatherCode: weatherCode,
        isDay: isDay);
  }
}

class HourlyWeatherServices {
  final double? latitude;
  final double? longitude;

  HourlyWeatherServices({required this.latitude, required this.longitude});

  Future<Map<String, dynamic>> fetchHourlyWeatherDetails() async {
    String requrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,rain,weather_code,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,uv_index_clear_sky_max,precipitation_hours,precipitation_probability_max,wind_speed_10m_max&timezone=auto&forecast_days=3&forecast_hours=24";
    final url = Uri.parse(requrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final Map<String, dynamic> mapHourly = {
        'time': <String>[],
        'temperature': <double>[],
        'relativeHumidity': <int>[],
        'precipitationProbability': <int>[],
        'rain': <double>[],
        'weatherCode': <int>[],
        'isDay': <int>[],
      };

      var hourlyWeatherData = HourlyWeatherData.fromJson(data);

      mapHourly['time'] = hourlyWeatherData.time;
      mapHourly['temperature'] = hourlyWeatherData.temperature;
      mapHourly['relativeHumidity'] = hourlyWeatherData.relativeHumidity;
      mapHourly['precipitationProbability'] =
          hourlyWeatherData.precipitationProbability;
      mapHourly['rain'] = hourlyWeatherData.rain;
      mapHourly['weatherCode'] = hourlyWeatherData.weatherCode;
      mapHourly['isDay'] = hourlyWeatherData.isDay;

      print(mapHourly);

      return mapHourly;
    } else {
      throw Exception("Failed to Fetch data ${response.statusCode}");
    }
  }
}
