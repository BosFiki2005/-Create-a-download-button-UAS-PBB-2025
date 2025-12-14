import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.wc, color: Colors.green, size: 60),
                const SizedBox(height: 10),
                const Text(
                  "Pilih Jenis Kelamin",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                RadioListTile(
                  activeColor: Colors.green,
                  title: Row(
                    children: const [
                      Icon(Icons.male, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Laki-laki",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  value: "Laki-laki",
                  groupValue: _gender,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: _gender == "Laki-laki"
                      ? Colors.blue.withOpacity(0.1)
                      : Colors.transparent,
                  onChanged: (value) {
                    setState(() => _gender = value);
                    _showTopNotification(context, "Kamu memilih Laki-laki 👨");
                  },
                ),
                const SizedBox(height: 8),
                RadioListTile(
                  activeColor: Colors.pink,
                  title: Row(
                    children: const [
                      Icon(Icons.female, color: Colors.pink),
                      SizedBox(width: 8),
                      Text("Perempuan",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  value: "Perempuan",
                  groupValue: _gender,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: _gender == "Perempuan"
                      ? Colors.pink.withOpacity(0.1)
                      : Colors.transparent,
                  onChanged: (value) {
                    setState(() => _gender = value);
                    _showTopNotification(context, "Kamu memilih Perempuan 👩");
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  _gender == null
                      ? "Belum ada pilihan"
                      : "Pilihan kamu: $_gender",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi notifikasi bagian atas
  void _showTopNotification(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          color: Colors.green[600],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }
}
