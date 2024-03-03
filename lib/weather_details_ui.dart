import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'daily_weather_details_widget.dart';
import 'frosted_glass_widget.dart';
import 'hourly_weather_details_widget.dart';

class CoreUI extends StatelessWidget {
  const CoreUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 4,
          child: WeatherDetailsWidget(
            context: context,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FrostedGlassWidget(
                    child: HourlyWeatherDetailsWidget(index: index),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
