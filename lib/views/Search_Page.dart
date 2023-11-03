// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';
import '../Providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;
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
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityname = cityName;
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
                          await service.getservice(CityName: cityName!);
                      Provider.of<weatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<weatherProvider>(context, listen: false)
                          .cityName = cityName;
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
