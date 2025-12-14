import 'package:flutter/material.dart';

class OpacityExample extends StatelessWidget {
  const OpacityExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.5, // 0.0 = transparan penuh, 1.0 = solid
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
            child: Text(
              "50% Transparan",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
