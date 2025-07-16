import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file or the screen you want to navigate to

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Delay of 3 seconds before navigating to main screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const bmiscreen()), // your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Image.asset(
            "assets/images/splash.jpg", // your splash image
            height: 500,
            width: 500,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
