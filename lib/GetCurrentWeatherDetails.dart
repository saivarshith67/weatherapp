import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentWeatherDetails {
  final double temperature2m;
  final double relativeHumidity2m;
  final double apparentTemperature;
  final int isDay;
  final double precipitation;
  final double rain;
  final double cloudCover;
  final double windSpeed10m;

  CurrentWeatherDetails(
      {required this.temperature2m,
        required this.relativeHumidity2m,
        required this.apparentTemperature,
        required this.isDay,
        required this.precipitation,
        required this.rain,
        required this.cloudCover,
        required this.windSpeed10m});

  factory CurrentWeatherDetails.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDetails(
        temperature2m: json['current']['temperature_2m'],
        relativeHumidity2m: json['current']['relative_humidity_2m'],
        apparentTemperature: json['current']['apparent_temperature'],
        isDay: json['current']['is_day'],
        precipitation: json['current']['precipitation'],
        rain: json['current']['rain'],
        cloudCover: json['current']['cloud_cover'],
        windSpeed10m: json['current']['wind_speed_10m']);
  }
}

class CurrentWeatherServices {
  final double latitude;
  final double longitude;

  CurrentWeatherServices({required this.latitude, required this.longitude});

  Future<Map<String, dynamic>> fetchCurrentWeatherDetails() async {
    String requrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,cloud_cover,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability&daily=temperature_2m_max,temperature_2m_min,uv_index_max,precipitation_hours,precipitation_probability_max,wind_speed_10m_max&past_hours=24&forecast_days=3&forecast_hours=24";
    final url = Uri.parse(requrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> map = {
        'temperature2m': 0,
        'relativeHumidity2m': 0,
        'apparentTemperature': 0,
        'isDay': 0,
        'precipitation': 0,
        'rain': 0,
        'cloudCover': 0,
        'windSpeed10m': 0,
      };

      map['temperature2m'] = data['current']['temperature_2m'];
      map['relativeHumidity2m'] = data['current']['relative_humidity_2m'];
      map['apparentTemperature'] = data['current']['apparent_temperature'];
      map['isDay'] = data['current']['is_day'];
      map['precipitation'] = data['current']['precipitation'];
      map['rain'] = data['current']['rain'];
      map['cloudCover'] = data['current']['cloud_cover'];
      map['windSpeed10m'] = data['current']['wind_speed_10m'];



      return map;
    } else {
      throw Exception("Failed to Fetch data ${response.statusCode}");
    }
  }
}
