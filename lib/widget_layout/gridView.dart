import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // jumlah kolom
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(
        9,
        (index) => Container(
          color: Colors.blue[(index + 1) * 100],
          child: Center(child: Text("Item $index")),
        ),
      ),
    );
  }
}
