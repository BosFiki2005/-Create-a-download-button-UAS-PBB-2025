import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Kartu Mahasiswa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Nama: Widi Arrohman"),
            Text("NIM: 123456789"),
          ],
        ),
      ),
    );
  }
}
