import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;
  const Category(this.name, this.icon, this.color);
}

const List<Category> kDefaultCategories = [
  Category('Food', Icons.restaurant_rounded, Color(0xFFFFA726)),
  Category('Bills', Icons.receipt_long_rounded, Color(0xFF42A5F5)),
  Category('Health', Icons.health_and_safety_rounded, Color(0xFF66BB6A)),
  Category('Travel', Icons.flight_takeoff_rounded, Color(0xFFAB47BC)),
  Category('Education', Icons.school_rounded, Color(0xFF26C6DA)),
  Category('Home', Icons.home_rounded, Color(0xFF8D6E63)),
  Category('Car', Icons.directions_car_filled_rounded, Color(0xFF5C6BC0)),
  Category('Tax', Icons.account_balance_rounded, Color(0xFFEF5350)),
];

class PengeluaranNotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  int _total = 0;

  List<Map<String, dynamic>> get daftarPengeluaran => _items;
  int get totalPengeluaran => _total;

  void tambahPengeluaran({
    required String nama,
    required int jumlah,
    required Category category,
  }) {
    _items.add({'nama': nama, 'jumlah': jumlah, 'category': category});
    _total += jumlah;
    notifyListeners();
  }

  void hapusPengeluaran(int index) {
    _total -= _items[index]['jumlah'] as int;
    _items.removeAt(index);
    notifyListeners();
  }

  void hapusSemua() {
    _items.clear();
    _total = 0;
    notifyListeners();
  }
}
