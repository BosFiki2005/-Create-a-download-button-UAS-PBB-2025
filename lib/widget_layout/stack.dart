import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        ColoredBox(
          color: Colors.blue,
          child: SizedBox(width: 150, height: 150),
        ),
        ColoredBox(color: Colors.red, child: SizedBox(width: 100, height: 100)),
        ColoredBox(
          color: Colors.yellow,
          child: SizedBox(width: 50, height: 50),
        ),
      ],
    );
  }
}
