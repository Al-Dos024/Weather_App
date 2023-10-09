import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import 'Search_Page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              }),
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null ? NoWeatherBody() : Container(),
    );
  }
}
