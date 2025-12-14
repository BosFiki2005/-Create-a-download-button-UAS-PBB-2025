import 'package:flutter/material.dart';

class StatelessWidgetExample extends StatelessWidget {
  const StatelessWidgetExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Halo, saya StatelessWidget!",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}
