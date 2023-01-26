import 'package:flutter/material.dart';
import 'package:qr_scanner/views/direcciones_page.dart';
import 'package:qr_scanner/views/maps_page.dart';
import 'package:qr_scanner/widgets/cscan.dart';
import 'package:qr_scanner/widgets/custom_navigator_bar.dart';

class HomePage extends StatelessWidget {
  final Color? elcolor;
  const HomePage({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Historial"),
        actions: [Icon(Icons.delete_forever, color: elcolor ?? Colors.amber)],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatioBar(),
      floatingActionButton: ScannButton(elcolor: elcolor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    const indice = 2;

    switch (indice) {
      case 1:
        return const MapasPages();
      case 2:
        return const DireccionesPage();
      default:
        return const MapasPages();
    }
  }
}
