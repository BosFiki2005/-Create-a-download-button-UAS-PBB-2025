import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        Center(child: Text("Halaman 1", style: TextStyle(fontSize: 24))),
        Center(child: Text("Halaman 2", style: TextStyle(fontSize: 24))),
        Center(child: Text("Halaman 3", style: TextStyle(fontSize: 24))),
      ],
    );
  }
}
