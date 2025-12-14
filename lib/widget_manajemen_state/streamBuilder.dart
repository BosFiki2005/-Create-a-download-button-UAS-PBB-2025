import 'package:flutter/material.dart';
import 'dart:async';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});
  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  Stream<int>? _stream;
  // Fungsi stream yang mengeluarkan angka dari 1 sampai 5
  Stream<int> numberStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Tombol untuk memulai ulang stream
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _stream = numberStream(); // memulai ulang dari awal
              });
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("Mulai Stream"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // 🔹 StreamBuilder untuk menampilkan hasil stream
          _stream == null
              ? const Text("Tekan tombol untuk memulai stream.")
              : StreamBuilder<int>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      return Text(
                        "Angka sekarang: ${snapshot.data}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const Text(
                        "✅ Stream selesai!",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      );
                    } else {
                      return const Text("Menunggu data...");
                    }
                  },
                ),
        ],
      ),
    );
  }
}
