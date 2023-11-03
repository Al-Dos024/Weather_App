import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel ==
                null
            ? Colors.green
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(),
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
