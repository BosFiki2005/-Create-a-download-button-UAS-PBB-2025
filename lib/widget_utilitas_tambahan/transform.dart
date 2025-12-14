import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformExample extends StatelessWidget {
  const TransformExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: math.pi / 8, // rotasi 22.5 derajat
        child: Container(
          width: 150,
          height: 150,
          color: Colors.orange,
          child: const Center(
            child: Text(
              "Rotasi!",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
