import 'package:flutter/material.dart';

class CustomNavigatioBar extends StatelessWidget {
  const CustomNavigatioBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: "Mapa"),
      ],
    );
  }
}