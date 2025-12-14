import 'package:flutter/material.dart';

class PaddingExample extends StatelessWidget {
  const PaddingExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20), // memberi jarak 20 di semua sisi
      child: Text(
        "Teks dengan padding 20",
        style: TextStyle(fontSize: 20, color: Colors.deepPurple),
      ),
    );
  }
}
