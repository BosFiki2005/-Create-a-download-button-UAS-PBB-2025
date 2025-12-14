import 'package:flutter/material.dart';
import '../models/pengeluaran_notifier.dart';

class PengeluaranScreen extends StatefulWidget {
  const PengeluaranScreen({super.key});

  @override
  State<PengeluaranScreen> createState() => _PengeluaranScreenState();
}

class _PengeluaranScreenState extends State<PengeluaranScreen> {
  final PengeluaranNotifier _notifier = PengeluaranNotifier();

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
      appBar: AppBar(title: const Text('Pengeluaran Harian')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
        backgroundColor: const Color(0xFF7C4DFF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TOTAL CARD (gradient)
            ListenableBuilder(
              listenable: _notifier,
              builder: (context, _) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
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
                        'Total Pengeluaran',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Rp ${_notifier.totalPengeluaran}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // LIST TRANSAKSI
            Expanded(
              child: ListenableBuilder(
                listenable: _notifier,
                builder: (context, _) {
                  final data = _notifier.daftarPengeluaran;
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        'Belum ada transaksi. Tekan tombol Tambah.',
                        style: TextStyle(color: Colors.black54),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      final item = data[i];
                      final Category cat = item['category'] as Category;
                      return Dismissible(
                        key: ValueKey('$i-${item['nama']}'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.redAccent,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _notifier.hapusPengeluaran(i),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundColor: cat.color.withOpacity(.15),
                              child: Icon(cat.icon, color: cat.color),
                            ),
                            title: Text(
                              item['nama'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(cat.name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Rp ${item['jumlah']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () =>
                                      _notifier.hapusPengeluaran(i),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8),

            // RESET SEMUA
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: _notifier.hapusSemua,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Semua Pengeluaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openAddSheet(BuildContext context) {
    final namaCtl = TextEditingController();
    final jumlahCtl = TextEditingController();
    Category selected = kDefaultCategories.first;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 16 + MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (ctx, setSt) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tambah Transaksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: namaCtl,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengeluaran',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: jumlahCtl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah (Rp)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // PILIH KATEGORI
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kategori',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final cat in kDefaultCategories)
                      ChoiceChip(
                        selected: selected == cat,
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(cat.icon, size: 18, color: cat.color),
                            const SizedBox(width: 6),
                            Text(cat.name),
                          ],
                        ),
                        selectedColor: cat.color.withOpacity(.15),
                        onSelected: (_) => setSt(() => selected = cat),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7C4DFF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      final nama = namaCtl.text.trim();
                      final jumlah = int.tryParse(jumlahCtl.text) ?? 0;
                      if (nama.isEmpty || jumlah <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Isi nama & jumlah dengan benar'),
                          ),
                        );
                        return;
                      }
                      _notifier.tambahPengeluaran(
                        nama: nama,
                        jumlah: jumlah,
                        category: selected,
                      );
                      Navigator.pop(ctx);
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
