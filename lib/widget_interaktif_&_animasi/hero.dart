import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HeroDetailPage()),
          );
        },
        child: const Hero(
          tag: 'fotoMahasiswa',
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/people.jpg'),
          ),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Mahasiswa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'fotoMahasiswa',
              child: const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/people.jpg'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Nama: Widi Arrohman",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("Prodi: Teknik Informatika"),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
