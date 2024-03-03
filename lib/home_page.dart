import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/frosted_glass_widget.dart';
import 'package:weatherapp/daily_weather_details_widget.dart';
import 'package:weatherapp/colours_and_text_styles.dart';
import 'package:weatherapp/hourly_weather_details_widget.dart';
import 'package:weatherapp/loading_screen.dart';
import 'package:weatherapp/weather_details_provider.dart';
import 'package:weatherapp/weather_details_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    print("Build Called");
    final provider = Provider.of<WeatherDetailsProvider>(context, listen: false);
    provider.fetchLocationDetails(context);

    provider.fetchDailyWeatherData();

    provider.fetchHourlyWeatherData();

    provider.setColour();

    provider.setDailyWeatherIcon();








    return Consumer<WeatherDetailsProvider>(

      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: value.colourPaletteForeground,
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontFamily: "InterSemiBold",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: TextButton(
            child: const Icon(Icons.more_vert_rounded, color: Colors.white),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {
                  build(context);
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ],
          centerTitle: true,
        ),
        backgroundColor: value.colourPaletteBackground,
        body: provider.isLoading ? const LoadingScreen() : const CoreUI(),
      ),
    );
  }
}
