import 'package:flutter/material.dart';
import 'dart:async';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});
  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  Future<String>? _futureData; // variabel untuk menyimpan Future
  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Data berhasil dimuat dari server!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Tombol untuk memulai proses getData()
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _futureData = getData();
              });
            },
            icon: const Icon(Icons.cloud_download),
            label: const Text("Muat Data"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // 🔹 FutureBuilder menampilkan hasil Future
          _futureData == null
              ? const Text("Tekan tombol untuk memuat data.")
              : FutureBuilder<String>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text("Terjadi kesalahan saat memuat data");
                    } else {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
