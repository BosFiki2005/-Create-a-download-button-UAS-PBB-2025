import 'package:flutter/material.dart';

class TonalButtonExample extends StatelessWidget {
  const TonalButtonExample({super.key});
  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        print("Tombol ditekan");
      },
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text("Simpan Perubahan"),
    );
  }
}
