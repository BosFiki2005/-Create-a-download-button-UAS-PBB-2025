import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/saldo_card.dart';

class TabunganScreen extends StatefulWidget {
  const TabunganScreen({super.key});

  @override
  State<TabunganScreen> createState() => _TabunganScreenState();
}

class _TabunganScreenState extends State<TabunganScreen> {
  final ValueNotifier<int> _saldo = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _loadSaldo();
  }

  Future<void> _loadSaldo() async {
    final prefs = await SharedPreferences.getInstance();
    _saldo.value = prefs.getInt('saldoTabungan') ?? 0;
  }

  Future<void> _saveSaldo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('saldoTabungan', _saldo.value);
  }

  void _tambahSaldo(int jumlah) {
    _saldo.value += jumlah;
    _saveSaldo();
  }

  void _ambilSaldo(int jumlah) {
    if (_saldo.value >= jumlah) {
      _saldo.value -= jumlah;
      _saveSaldo();
    }
  }

  LinearGradient get _grad => const LinearGradient(
    colors: [
      Color.fromARGB(255, 249, 251, 249),
      Color.fromARGB(255, 223, 216, 224),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabungan Pribadi'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: _grad)),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: _grad),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _saldo,
                  builder: (context, _) {
                    return SaldoCard(saldoTabungan: _saldo);
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  'Kelola Tabungan Anda',
                  style: TextStyle(
                    color: Color.fromARGB(255, 126, 122, 122),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_circle_outline_rounded),
                        label: const Text('Tambah Rp 20.000'),
                        onPressed: () => _tambahSaldo(20000),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          foregroundColor: const Color.fromARGB(
                            255,
                            16,
                            16,
                            14,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.remove_circle_outline_rounded),
                        label: const Text('Ambil Rp 10.000'),
                        onPressed: () => _ambilSaldo(10000),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          foregroundColor: const Color.fromARGB(
                            255,
                            16,
                            16,
                            14,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '💰 Simpan, kelola, dan raih tujuan finansialmu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      11,
                      54,
                      208,
                    ).withOpacity(0.8),
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
