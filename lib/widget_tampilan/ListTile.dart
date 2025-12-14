import 'package:flutter/material.dart';

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.school, color: Colors.blue),
      title: const Text("Pemrograman Flutter"),
      subtitle: const Text("Dosen: Bapak Andi"),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        print("on tap di klik");
      },
    );
  }
}
