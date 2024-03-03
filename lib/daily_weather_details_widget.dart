import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/weather_details_provider.dart';
import 'colours_and_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherDetailsWidget extends StatefulWidget {
  final BuildContext context;

  const WeatherDetailsWidget({super.key, required this.context});

  @override
  State<WeatherDetailsWidget> createState() => _WeatherDetailsWidgetState();
}

class _WeatherDetailsWidgetState extends State<WeatherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Consumer<WeatherDetailsProvider>(
      builder: (context, dailyWeatherDetails, child) => SizedBox(
        height: height * 0.65,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
                bottom: BorderSide(width: 2, color: Colors.white)),
            color: dailyWeatherDetails.colourPaletteForeground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Text(
                dailyWeatherDetails.time[0].toString(),
                style: const TextStyle(
                    fontFamily: "InterSemiBold",
                    color: Colors.white,
                    fontSize: 15.0),
              ),
              const SizedBox(
                height: 30,
              ),
              //Icon
              const SizedBox(
                height: 230,
                width: 230,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${dailyWeatherDetails.tempMax}°C",
                style: HeadingStyle().toTextStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.thermostat,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          // "",
                          "${dailyWeatherDetails.tempMin}°C",
                          style: RegularStyle().toTextStyle(),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Temp min.",
                          style: RegularStyle().toTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          // "",
                          "${dailyWeatherDetails.precipitationProbabilityDaily}%",
                          style: RegularStyle().toTextStyle(),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Rain",
                          style: RegularStyle().toTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.air,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          // "",
                          "${dailyWeatherDetails.windSpeed} kmph",
                          style: RegularStyle().toTextStyle(),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Wind",
                          style: RegularStyle().toTextStyle(),
                        ),
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
