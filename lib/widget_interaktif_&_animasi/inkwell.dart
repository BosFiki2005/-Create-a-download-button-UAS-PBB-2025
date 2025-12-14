import 'package:flutter/material.dart';

class InkWellDashboardExample extends StatelessWidget {
  const InkWellDashboardExample({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.book, "label": "Kelas"},
      {"icon": Icons.assignment, "label": "Tugas"},
      {"icon": Icons.message, "label": "Pesan"},
      {"icon": Icons.settings, "label": "Pengaturan"},
    ];
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: menuItems.map((item) {
        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("${item['label']} dibuka")));
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], size: 48, color: Colors.teal[700]),
                const SizedBox(height: 8),
                Text(item["label"], style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
