import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<weatherProvider>(context).weatherData ==
                  null
              ? Colors.blue
              : Provider.of<weatherProvider>(context).weatherData!.getColor()),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
