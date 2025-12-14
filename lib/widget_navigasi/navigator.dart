import 'package:flutter/material.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
        child: const Text("Pergi ke Halaman Kedua"),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text("UTS")),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Kembali ke Halaman Sebelumnya"),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
