import 'package:flutter/material.dart';

class TimePickerDialogExample extends StatefulWidget {
  const TimePickerDialogExample({super.key});
  @override
  State<TimePickerDialogExample> createState() =>
      _TimePickerDialogExampleState();
}

class _TimePickerDialogExampleState extends State<TimePickerDialogExample> {
  TimeOfDay? selectedTime;
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() => selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _pickTime(context),
          child: const Text("Pilih Waktu"),
        ),
        const SizedBox(height: 10),
        Text(
          selectedTime == null
              ? "Belum ada waktu yang dipilih"
              : "Waktu dipilih: ${selectedTime!.format(context)}",
        ),
      ],
    );
  }
}
