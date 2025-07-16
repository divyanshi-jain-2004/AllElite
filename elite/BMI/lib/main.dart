import 'package:bmi/splash.dart';
import 'package:flutter/material.dart';
import 'Second.dart';

void main() {
  runApp(const bmi());
}

class bmi extends StatelessWidget {
  const bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home:  bmiscreen(),
    );
  }
}

class bmiscreen extends StatefulWidget {
  const bmiscreen({super.key});

  @override
  State<bmiscreen> createState() => bmiscreenState();
}

class bmiscreenState extends State<bmiscreen> {
  bool isMaleSelected = true;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          children: [
            Image.asset(
              "assets/images/bmi.png",
              fit: BoxFit.contain,
              height: 60,
              width: 70,
            ),
            const SizedBox(width: 10),
            const Text(
              'BMI Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: screenWidth > 600
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/girl.png",
                fit: BoxFit.contain,
                height: 300,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(flex: 1, child: buildFormSection()),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/girl.png",
              fit: BoxFit.contain,
              height: 300,
            ),
            const SizedBox(height: 20),
            buildFormSection(),
          ],
        ),
      ),
    );
  }

  Widget buildFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter Your Details:",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: _buildGenderButton(
                "Male",
                Icons.male,
                isMaleSelected,
                    () {
                  setState(() {
                    isMaleSelected = true;
                  });
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildGenderButton(
                "Female",
                Icons.female,
                !isMaleSelected,
                    () {
                  setState(() {
                    isMaleSelected = false;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        TextField(
          controller: _heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Height (cm)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),

        TextField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Weight (kg)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              double height = double.tryParse(_heightController.text) ?? 0;
              double weight = double.tryParse(_weightController.text) ?? 0;

              if (height > 0 && weight > 0) {
                double bmi = weight / ((height / 100) * (height / 100));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Second(bmi: bmi),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please enter valid height and weight."),
                ));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Calculate BMI",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderButton(
      String label, IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueGrey : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.grey.shade200),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.grey.shade200,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
