import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavigatioBar extends StatelessWidget {
  const CustomNavigatioBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);


    final indiceactual = uiprovider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (i) => uiprovider.selectedMenuOpt =  i,
      currentIndex: indiceactual,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: "Mapa"),
        BottomNavigationBarItem(icon: Icon(Icons.wifi), label: "Http"),
      ],
    );
  }
}
