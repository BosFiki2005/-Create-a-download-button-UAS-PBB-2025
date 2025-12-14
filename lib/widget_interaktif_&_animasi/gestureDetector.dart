import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});
  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String message = "Sentuh kotak di bawah";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => message = "Kotak ditekan!"),
      onDoubleTap: () => setState(() => message = "Ditekan dua kali!"),
      onLongPress: () => setState(() => message = "Tekan lama!"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          Container(width: 150, height: 150, color: Colors.blue),
        ],
      ),
    );
  }
}
