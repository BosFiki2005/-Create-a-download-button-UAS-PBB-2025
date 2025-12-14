import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        10,
        (index) => ListTile(
          leading: const Icon(Icons.person),
          title: Text("Mahasiswa $index"),
        ),
      ),
    );
  }
}
