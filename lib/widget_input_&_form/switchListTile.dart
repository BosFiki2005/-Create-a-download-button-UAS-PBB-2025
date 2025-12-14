import 'package:flutter/material.dart';

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});
  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Mode Gelap"),
      subtitle: const Text("Aktifkan tema gelap aplikasi"),
      value: isOn,
      onChanged: (value) {
        setState(() => isOn = value);
      },
      secondary: const Icon(Icons.dark_mode),
    );
  }
}
