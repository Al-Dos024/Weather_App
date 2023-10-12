import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import '../Providers/weather_provider.dart';
import '../widgets/weather_info_body.dart';
import 'Search_Page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
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
                icon: const Icon(Icons.search))
          ],
        ),
        body: weatherData == null
            ? const NoWeatherBody()
            : WeatherInfoBody(
                weatherData: weatherData,
              ));
  }
}
