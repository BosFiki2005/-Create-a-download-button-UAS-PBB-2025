import 'package:flutter/material.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});
  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final _formKey = GlobalKey<FormState>();
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  String _hasil = "";
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _hasil =
            "Data Mahasiswa:\nNIM: ${_nimController.text}\nNama: ${_namaController.text}";
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data berhasil disimpan!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: "NIM Mahasiswa",
                hintText: "Masukkan NIM (contoh: 12345678)",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "NIM tidak boleh kosong";
                } else if (value.length < 5) {
                  return "NIM minimal 5 digit";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama Mahasiswa",
                hintText: "Masukkan nama lengkap",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submitForm, child: const Text("Simpan")),
            const SizedBox(height: 16),
            Text(
              _hasil,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
