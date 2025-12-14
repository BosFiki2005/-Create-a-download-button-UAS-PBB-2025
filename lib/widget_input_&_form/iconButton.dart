import 'package:flutter/material.dart';

class IconButtonExample extends StatefulWidget {
  const IconButtonExample({super.key});

  @override
  State<IconButtonExample> createState() => _IconButtonExampleState();
}

class _IconButtonExampleState extends State<IconButtonExample>
    with SingleTickerProviderStateMixin {
  bool _isFavorited = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.7,
      upperBound: 1.2,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    _controller.forward(from: 0.7);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorited
              ? "Konten disukai ⭐"
              : "Batal menyukai konten ❌",
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _isFavorited ? Colors.amber : Colors.grey,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: IconButton(
              onPressed: _onPressed,
              icon: Icon(
                _isFavorited ? Icons.star : Icons.star_border,
                color: _isFavorited ? Colors.amber[700] : Colors.grey,
                size: 40,
              ),
              tooltip: "Sukai konten ini",
            ),
          ),
        ),
      ),
    );
  }
}
