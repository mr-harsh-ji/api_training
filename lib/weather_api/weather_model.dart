class WeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind?wind;
  Clouds?clouds;
  int? dt;
  Sys?sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;



  WeatherModel(
      {this.coord, this.weather, this.base, this.main, this.visibility, this.wind, this.clouds, this.dt, this.sys, this.timezone, this.id, this.name, this.cod});


  static WeatherModel modelToJson(Map<String,dynamic>data){
    var coord = Coord(data["coord"]['lon'], data["coord"]['lat']);//this is for coord

    List<dynamic> weather = data['weather']; //this is for weather
    var weatherModelList = weather.map((e) => Weather.jsonToModel(e),).toList();

    var main = Main(data["main"]["temp"], data["main"]["feels_like"], data["main"]["temp_min"], data["main"]["temp_max"], data["main"]["pressure"], data["main"]["humidity"], data["main"]["sea_level"], data["main"]["grnd_level"]);
    var wind = Wind(data["wind"]["speed"], data["wind"]["deg"], data["wind"]["gust"]);
    var clouds = Clouds(data["clouds"]["all"]);
    var sys = Sys(data["sys"]["sunrise"], data["sys"]["sunset"]);

    return WeatherModel(
      coord:coord,
      weather:weatherModelList,
      base: data["base"],
      main: main,
      visibility: data["visibility"],
      wind: wind,
      clouds: clouds,
      dt: data["dt"],
      sys: sys,
      timezone: data["timezone"],
      id: data["id"],
      name: data["name"],
      cod: data["cod"],
    );

  }
}



class Coord{
  double? lon;
  double? lat;
  Coord(this.lon, this.lat);

}

class Weather{
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather(this.id, this.main, this.description, this.icon);
  static Weather jsonToModel (Map<String, dynamic> data){
    return Weather(data['id'], data['main'], data['description'], data['icon']);
  }
}

class Main{
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  int? pressure;
  int? humidity;
  int? sea_level;
  int? grnd_level;

  Main(this.temp, this.feels_like, this.temp_min, this.temp_max, this.pressure, this.humidity, this.sea_level, this.grnd_level);

}

class Wind{
  double? speed;
  int? deg;
  double? gust;
  Wind(this.speed, this.deg, this.gust);
}

class Clouds{
  int? all;
  Clouds(this.all);
}

class Sys{
  int? sunrise;
  int? sunset;
  Sys(this.sunrise, this.sunset);
}