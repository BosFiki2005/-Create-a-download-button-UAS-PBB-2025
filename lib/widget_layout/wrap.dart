import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // jarak horizontal
      runSpacing: 4, // jarak vertikal
      children: List.generate(10, (index) => Chip(label: Text("Item $index"))),
    );
  }
}
