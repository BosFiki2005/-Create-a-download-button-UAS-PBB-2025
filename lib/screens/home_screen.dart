import 'package:flutter/material.dart';
import 'pengeluaran_screen.dart';
import 'tabungan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 170,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: _grad),
              child: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  ' Keuangan Fiki',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _ActionCard(
                    title: 'Kelola Pengeluaran Harian',
                    icon: Icons.receipt_long_rounded,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PengeluaranScreen(),
                      ),
                    ),
                    gradient: _grad,
                  ),
                  const SizedBox(height: 16),
                  _ActionCard(
                    title: 'Kelola Tabungan Pribadi',
                    icon: Icons.savings_rounded,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TabunganScreen()),
                    ),
                    gradient: _grad,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient gradient;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                gradient: gradient,
              ),
              child: Icon(icon, color: Colors.white, size: 40),
              alignment: Alignment.center,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
