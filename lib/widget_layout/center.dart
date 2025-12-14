import 'package:flutter/material.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Teks ini berada di tengah",
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
