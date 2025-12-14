import 'package:flutter/material.dart';

class FlexibleExample extends StatelessWidget {
  const FlexibleExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(color: Colors.blue),
        ),
        Flexible(
          flex: 2,
          child: Container(color: const Color.fromARGB(255, 240, 82, 9)),
        ),
        Flexible(
          flex: 3,
          child: Container(color: const Color.fromARGB(255, 198, 243, 33)),
        ),
      ],
    );
  }
}
