import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';

import '../Providers/weather_provider.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, this.weatherData}) : super(key: key);
  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherData!.getColor(),
          weatherData!.getColor()[300]!,
          weatherData!.getColor()[50]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            Provider.of<weatherProvider>(context).cityName ?? "Cairo Is Error",
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'last updated : ${weatherData!.date!.hour.toString()}:${weatherData!.date!.minute.toString()}',
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp!.toInt().toString(),
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('minTemp : ${weatherData!.minTemp!.toInt()}'),
                  Text('maxTemp = ${weatherData!.maxTemp!.toInt()}')
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherStateName ?? ' ',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
