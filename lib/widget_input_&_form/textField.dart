import 'package:flutter/material.dart';

class TextfieldExample extends StatefulWidget {
  const TextfieldExample({super.key});
  @override
  State<TextfieldExample> createState() => _TextfieldExampleState();
}

class _TextfieldExampleState extends State<TextfieldExample> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // letak pengetahuan baru ada disini (TextField)
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Nama Mahasiswa",
              hintText: "Masukkan nama lengkap",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _result = _controller.text;
              });
            },
            child: const Text("Tampilkan Nama"),
          ),
          const SizedBox(height: 8),
          Text(
            _result.isEmpty ? "Belum ada input." : "Halo, $_result!",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
