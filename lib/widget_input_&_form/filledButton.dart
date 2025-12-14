import 'package:flutter/material.dart';

class FilledButtonExample extends StatelessWidget {
  const FilledButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Tampilkan notifikasi singkat saat tombol ditekan
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Menampilkan detail... 📋"),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(16),
                backgroundColor: Colors.teal,
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF26A69A), // Hijau toska terang
                  Color(0xFF00695C), // Hijau toska tua
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Lihat Detail",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
