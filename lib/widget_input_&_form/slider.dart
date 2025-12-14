import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _nilai = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Penilaian Kehadiran:"),
        Slider(
          value: _nilai,
          min: 0,
          max: 1,
          divisions: 10,
          label: (_nilai * 100).toStringAsFixed(0),
          onChanged: (value) {
            setState(() => _nilai = value);
          },
        ),
        Text("Nilai kehadiran: ${(_nilai * 100).toStringAsFixed(0)}%"),
      ],
    );
  }
}
