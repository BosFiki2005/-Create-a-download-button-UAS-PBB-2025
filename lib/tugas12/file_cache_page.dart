import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileCachePage extends StatefulWidget {
  const FileCachePage({Key? key}) : super(key: key);

  @override
  State<FileCachePage> createState() => _FileCachePageState();
}

class _FileCachePageState extends State<FileCachePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounterFromFile();
  }

  Future<File> _getCounterFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/file_counter.txt';
    return File(path);
  }

  Future<void> _loadCounterFromFile() async {
    try {
      final file = await _getCounterFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final parsed = int.tryParse(contents.trim()) ?? 0;
        setState(() {
          _counter = parsed;
        });
      } else {
        setState(() {
          _counter = 0;
        });
      }
    } catch (_) {
      setState(() {
        _counter = 0;
      });
    }
  }

  Future<void> _saveCounterToFile() async {
    final file = await _getCounterFile();
    await file.writeAsString(_counter.toString());
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await _saveCounterToFile();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Counter tersimpan di file_counter.txt'),
        backgroundColor: Colors.indigo.shade400,
      ),
    );
  }

  Future<void> _resetCounter() async {
    setState(() {
      _counter = 0;
    });
    await _saveCounterToFile();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Counter direset (file diperbarui)'),
        backgroundColor: Colors.redAccent.shade200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4FF),
      appBar: AppBar(
        title: const Text(
          'Dashboard Cache - Pertemuan 12',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E8),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),

                // ================== ISI CARD ==================
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'File System Cache',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Counter disimpan di file teks (file_counter.txt) menggunakan path_provider + File.',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),

                    const SizedBox(height: 24),

                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 32,
                    ),

                    const SizedBox(height: 12),
                    Text(
                      'Tombol ditekan: $_counter kali',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _incrementCounter,
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade400,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: _resetCounter,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            side: BorderSide(
                              color: Colors.redAccent.shade200,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
