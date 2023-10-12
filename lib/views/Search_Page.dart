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
        title: const Text("Search a City "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather =
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
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                label: const Text("Search"),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getservice(CityName: CityName!);
                      Provider.of<weatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<weatherProvider>(context, listen: false)
                          .cityName = CityName;
                      print(weather);
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)),
                border: const OutlineInputBorder(),
                hintText: "Enter a City :"),
          ),
        ),
      ),
    );
  }
}
