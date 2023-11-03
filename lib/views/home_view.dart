// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/Cubit/weather_state.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';
import 'Search_Page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    // weatherData = Provider.of<weatherProvider>(context).weatherData;
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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return WeatherInfoBody(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text("There is something Wrong here , try again"),
            );
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}

//  weatherData == null
//           ? const NoWeatherBody()
//           : WeatherInfoBody(
//               weatherData: weatherData,
//             ),