import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});
  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String? _selectedJurusan;

  Color _getColor(String? jurusan) {
    switch (jurusan) {
      case "TI":
        return Colors.grey;
      case "TE":
        return Colors.redAccent;
      case "MAB":
        return Colors.indigoAccent;
      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Pilih Jurusan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade300, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                    isExpanded: true,
                    value: _selectedJurusan,
                    hint: const Text(
                      "Pilih Jurusan",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "TI",
                        child: Text("Teknologi  Informasi"),
                      ),
                      DropdownMenuItem(
                        value: "TE",
                        child: Text("Teknik Elektro"),
                      ),
                      DropdownMenuItem(
                        value: "MAB",
                        child: Text("Manajemen Agri Bisnis"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _selectedJurusan = value);
                      _showTopNotification(context, value);
                    },
                    selectedItemBuilder: (context) {
                      return [
                        Text(
                          "Teknologi Informasi",
                          style: TextStyle(
                              color: _getColor("TI"),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Teknik Elektro",
                          style: TextStyle(
                              color: _getColor("TE"),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Manajemen Agri Bisnis",
                          style: TextStyle(
                              color: _getColor("MAB"),
                              fontWeight: FontWeight.bold),
                        ),
                      ];
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedJurusan != null)
                Text(
                  "Jurusan terpilih: ${_selectedJurusan == "TI" ? "Teknologi Informasi" : _selectedJurusan == "TE" ? "Teknik Elektro" : "Manajemen Agri Bisnis"}",
                  style: TextStyle(
                    color: _getColor(_selectedJurusan),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi notifikasi di bagian atas
  void _showTopNotification(BuildContext context, String? jurusan) {
    final overlay = Overlay.of(context);
    final warna = _getColor(jurusan);
    final namaJurusan = jurusan == "TI"
        ? "Teknologi Informasi"
        : jurusan == "TE"
            ? "Teknik Elektro"
            : "Manajemen Agri Bisnis";

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          color: warna,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              "Kamu memilih $namaJurusan",
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
