import 'package:flutter/material.dart';

class SaldoCard extends StatelessWidget {
  final ValueNotifier<int> saldoTabungan;
  const SaldoCard({super.key, required this.saldoTabungan});

  LinearGradient get _grad => const LinearGradient(
    colors: [
      Color.fromARGB(255, 58, 178, 11),
      Color.fromARGB(255, 223, 216, 224),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: saldoTabungan,
      builder: (_, value, __) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: _grad,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saldo Tabungan',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 6),
              Text(
                'Rp $value',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
