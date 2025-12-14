import 'package:flutter/material.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomRight, // posisi di kanan bawah
      child: Text(
        "Teks di kanan bawah",
        style: TextStyle(fontSize: 20, color: Colors.teal),
      ),
    );
  }
}
