import 'package:flutter/material.dart';

class CheckboxListTileExample extends StatefulWidget {
  const CheckboxListTileExample({super.key});

  @override
  State<CheckboxListTileExample> createState() =>
      _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shadowColor: Colors.green.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.green; // warna saat dicentang
                      }
                      return Colors.grey; // warna default
                    },
                  ),
                ),
              ),
              child: CheckboxListTile(
                title: const Text(
                  "Aktifkan Notifikasi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  "Terima pemberitahuan update aplikasi",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                value: isChecked,
                onChanged: (value) {
                  setState(() => isChecked = value!);
                  print(isChecked
                      ? "Checkbox diaktifkan"
                      : "Checkbox dinonaktifkan");
                },
                secondary: Icon(
                  Icons.notifications,
                  color: isChecked ? Colors.green : Colors.grey,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                activeColor: Colors.green, // warna kotak saat dicentang
                checkColor: Colors.white, // warna tanda centang
              ),
            ),
          ),
        ),
      ),
    );
  }
}
