// ignore_for_file: must_be_immutable

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
      body: weatherData != null
          ? NoWeatherBody()
          : Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "CityName",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Time : 2-12-2003",
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      Text(
                        "30",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [Text('minTemp = 12'), Text('maxTemp = 30')],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Clear",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
