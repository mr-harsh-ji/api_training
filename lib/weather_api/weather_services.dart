import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/weather_model.dart';

class WeatherServices{

  static Future<WeatherModel?> getWeather()async{
    var result = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=88.7676&lon=77.9899&appid=0e3b9b6d1eb15d7e2e84da8403ab426b"));
    if(result.statusCode == 200){
      var jsonBody = jsonDecode(result.body);
      var jsonModel = WeatherModel.modelToJson(jsonBody);
      return jsonModel;
    }
      return null;
  }
}