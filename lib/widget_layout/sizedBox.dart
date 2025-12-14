import 'package:flutter/material.dart';

class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Atas"),
        SizedBox(height: 20), // jarak antar widget
        Text("Bawah"),
      ],
    );
  }
}
