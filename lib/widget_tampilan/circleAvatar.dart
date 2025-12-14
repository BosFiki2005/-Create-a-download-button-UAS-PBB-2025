import 'package:flutter/material.dart';

class CircleAvatarExample extends StatelessWidget {
  const CircleAvatarExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(
        "https://i.pravatar.cc/150?img=2",
      ), // contoh foto profil online
    );
  }
}
