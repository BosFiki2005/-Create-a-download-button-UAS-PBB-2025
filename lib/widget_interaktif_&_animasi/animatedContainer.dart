import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});
  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double size = 100;
  Color color = Colors.blue;
  void changeShape() {
    setState(() {
      size = Random().nextInt(200).toDouble() + 50;
      color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: changeShape,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: size,
          height: size,
          color: color,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
