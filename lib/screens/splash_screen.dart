import 'package:flutter/material.dart';
import 'package:know_your_weather/constants.dart';
import 'package:know_your_weather/screens/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const LoadingScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conPrimaryColor,
      body: Center(
        child: Image.asset("assets/images/weather_logo.png"),
      ),
    );
  }
}
