import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final double bmi;

  const Second({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    String resultText = "";
    Color resultColor = Colors.black;

    if (bmi < 18.5) {
      resultText = "Underweight";
      resultColor = Colors.orange;
    } else if (bmi < 24.9) {
      resultText = "Normal";
      resultColor = Colors.green;
    } else if (bmi < 29.9) {
      resultText = "Overweight";
      resultColor = Colors.redAccent;
    } else {
      resultText = "Obese";
      resultColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "BMI Result",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/bmi.jpg",
              height: 400,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Text(
              "Your BMI is:",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Text(
              resultText,
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  color: resultColor), // Dynamic color here
            ),
          ],
        ),
      ),
    );
  }
}
