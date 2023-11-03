import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_state.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityname;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getservice(CityName: cityName);
      emit(
        WeatherSuccess(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
