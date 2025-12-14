import 'package:flutter/material.dart';

class SafeAreaExample extends StatelessWidget {
  const SafeAreaExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Teks ini tidak tertutup notch atau status bar!",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
