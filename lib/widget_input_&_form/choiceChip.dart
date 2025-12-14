import 'package:flutter/material.dart';

class ChoiceChipExample extends StatefulWidget {
  const ChoiceChipExample({super.key});
  @override
  State<ChoiceChipExample> createState() => _ChoiceChipExampleState();
}

class _ChoiceChipExampleState extends State<ChoiceChipExample> {
  String _selected = "Pagi";

  // Fungsi untuk menampilkan snackbar di bagian atas
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
          color: Colors.blueAccent,
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

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {"label": "Pagi", "color": Colors.orangeAccent},
      {"label": "Siang", "color": Colors.amber},
      {"label": "Malam", "color": Colors.indigoAccent},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Pilih Waktu Aktivitas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  children: options.map((option) {
                    final isSelected = _selected == option["label"];
                    return ChoiceChip(
                      label: Text(
                        option["label"],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: option["color"],
                      backgroundColor: Colors.grey[300],
                      elevation: isSelected ? 6 : 1,
                      onSelected: (_) {
                        setState(() => _selected = option["label"]);
                        _showTopNotification(
                            context, "Kamu memilih ${option["label"]} 🌞");
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
