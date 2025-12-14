import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.red, child: SizedBox(height: 50)),
        ),
        Expanded(
          flex: 2,
          child: ColoredBox(color: Colors.blue, child: SizedBox(height: 50)),
        ),
      ],
    );
  }
}
