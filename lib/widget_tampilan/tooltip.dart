import 'package:flutter/material.dart';

class TooltipExample extends StatelessWidget {
  const TooltipExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message: "Tooltip ini akan tampil jika ditekan lama.",
      child: Icon(Icons.info, size: 40, color: Colors.blue),
    );
  }
}
