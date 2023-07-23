import 'package:flutter/material.dart';
import 'package:know_your_weather/constants.dart';
import 'package:know_your_weather/screens/location_screen.dart';

import '../services/location.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  void getWeatherData() async {
    WeatherModel weatherInfo = WeatherModel();
    await weatherInfo.getCurrentLocationWeather();
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherInfo,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: conPrimaryColor,
        ),
      ),
    );
  }
}
