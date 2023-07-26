import 'package:flutter/material.dart';

import '../services/weather.dart';
import '../widgets/drop_down_search.dart';
import 'location_screen.dart';
class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  String _selectedOption = '';

  getCityWeather(city)async{
    WeatherModel weatherInfo = WeatherModel();
    await weatherInfo.getCityLocationWeather(city);
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherInfo,
        );
      }));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SearchableDropdownFormField(
                  labelText: 'Select an city',
                  options: const ['paris', 'gaza', 'tokyo', "mumbai", "dubai"],
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                Text('Selected option: $_selectedOption'),
                ElevatedButton(onPressed: ()async{ await getCityWeather(_selectedOption);}, child: const Text("get Weather"))
              ],
            ),
          ),
        ),
      ),
    );

  }
}
