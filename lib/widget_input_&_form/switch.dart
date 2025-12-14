import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});
  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Aktifkan Notifikasi"),
        Switch(
          value: _isActive,
          onChanged: (value) {
            setState(() => _isActive = value);
          },
        ),
      ],
    );
  }
}
