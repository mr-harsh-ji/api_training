import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.callWeatherApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: Consumer<WeatherProvider>(builder: (context, value, child) {
        return ListTile(
          title: Text("Temperature = ${value.weatherModel?.main?.temp} °C\nLatitude:${value.weatherModel?.coord?.lat}\nLongitude:${value.weatherModel?.coord?.lon}"),
          subtitle: Column(
            children: [

              Text("Feels Like:${value.weatherModel?.main?.feels_like}"),
              Text("Temp Min:${value.weatherModel?.main?.temp_min}"),
              Text("Temp Max:${value.weatherModel?.main?.temp_max}"),
              Text("Humidity:${value.weatherModel?.main?.humidity}"),
              Text("Pressure:${value.weatherModel?.main?.pressure}"),
              Text("Sea Level:${value.weatherModel?.main?.sea_level}"),
              Text("Ground Level:${value.weatherModel?.main?.grnd_level}"),


              Text("Visibility:${value.weatherModel?.visibility}"),


              Text("Speed:${value.weatherModel?.wind?.speed}"),
              Text("Deg:${value.weatherModel?.wind?.deg}"),
              Text("Gust:${value.weatherModel?.wind?.gust}"),

              Text("Clouds:${value.weatherModel?.clouds?.all}"),


              Text("Dt:${value.weatherModel?.dt}"),

              Text("Sunrise:${value.weatherModel?.sys?.sunrise}"),
              Text("Sunset:${value.weatherModel?.sys?.sunset}"),
              Text("Timezone:${value.weatherModel?.timezone}"),
              Text("Id:${value.weatherModel?.id}"),
              Text("Name:${value.weatherModel?.name}"),
              Text("Cod:${value.weatherModel?.cod}"),

            ],
          ),
          // trailing: Text("${value.weatherModel?.weather}"),
        );
      },),
    );
  }
}
