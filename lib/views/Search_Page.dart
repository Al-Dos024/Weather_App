// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

import '../Providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (Data) async {
              CityName = Data;

              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getservice(CityName: CityName!);
              Provider.of<weatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<weatherProvider>(context, listen: false).cityName =
                  CityName;
              print(weather);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                label: Text("Search"),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: "Enter a City :"),
          ),
        ),
      ),
    );
  }
}
