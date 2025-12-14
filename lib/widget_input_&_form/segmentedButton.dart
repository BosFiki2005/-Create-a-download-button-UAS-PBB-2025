import 'package:flutter/material.dart';

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});
  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  String _selected = "Pagi";
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: "Pagi", label: Text("Pagi")),
        ButtonSegment(value: "Siang", label: Text("Siang")),
        ButtonSegment(value: "Malam", label: Text("Malam")),
      ],
      selected: {_selected},
      onSelectionChanged: (newSelection) {
        print("Segmented button ditekan dengan nilai $_selected");
        setState(() => _selected = newSelection.first);
      },
    );
  }
}
