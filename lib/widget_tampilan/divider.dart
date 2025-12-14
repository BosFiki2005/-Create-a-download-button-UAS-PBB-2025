import 'package:flutter/material.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Data Mahasiswa"),
        Divider(thickness: 2, color: Colors.grey),
        Text("Data Dosen"),
      ],
    );
  }
}
