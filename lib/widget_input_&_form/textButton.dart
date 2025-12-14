import 'package:flutter/material.dart';

class TextButtonExample extends StatelessWidget {
  const TextButtonExample({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("Tombol ditekan");
      },
      style: TextButton.styleFrom(foregroundColor: Colors.deepPurple),
      child: const Text("Lihat Selengkapnya"),
    );
  }
}
