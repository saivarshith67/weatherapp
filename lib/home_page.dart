import 'package:flutter/material.dart';
import 'package:weatherapp/frosted_glass_widget.dart';
import 'package:weatherapp/weather_details_widget.dart';
import 'package:weatherapp/colours_and_text_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColourPalette().blue.withOpacity(1),
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontFamily: "InterSemibold",
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
                setState(() {});
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
      backgroundColor: ColourPalette().lightBlue.withOpacity(1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WeatherDetailsWidget(
            context: context,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FrostedGlassWidget(),
                    )),
          )
        ],
      ),
    );
  }
}
