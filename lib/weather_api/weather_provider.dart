import 'package:flutter/cupertino.dart';
import 'package:weather_api/weather_model.dart';
import 'package:weather_api/weather_services.dart';

class WeatherProvider with ChangeNotifier{

  WeatherModel? weatherModel;

  callWeatherApi()async{
    var result = await WeatherServices.getWeather();
    if(result != null){
      weatherModel = result;
      notifyListeners();
    }
  }

}