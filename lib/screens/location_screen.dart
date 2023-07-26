import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:know_your_weather/constants.dart';
import 'package:know_your_weather/screens/drop_down_screen.dart';
import 'package:know_your_weather/screens/loading_screen.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final WeatherModel weatherData;

  const LocationScreen({super.key, required this.weatherData});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  late int temp;
  late String cityName;
  late String icon;
  late String description;

  @override
  void initState() {
    temp = widget.weatherData.temp.toInt();
    cityName = widget.weatherData.name;
    icon = widget.weatherData.getWeatherIcon();
    description = widget.weatherData.getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('images/location_background.jpg'),
                image: const NetworkImage(
                    'https://source.unsplash.com/random/?nature,day'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  // color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoadingScreen(),),);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: conPrimaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const DropDownScreen()));
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: conPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(icon, style: const TextStyle(fontSize: 100),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$temp',
                          style: const TextStyle(color: Colors.black, fontSize: 100),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 7,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                            const Text(
                              'now',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Spartan MB',
                                letterSpacing: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  description,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.black, fontSize: 50),
                ),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(34),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Text('Weather'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
