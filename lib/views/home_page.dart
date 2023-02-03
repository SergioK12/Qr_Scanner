import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provide.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
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
        title: const Text("Lector Qr"),
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatioBar(),
      floatingActionButton: const ScannButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final indice = uiprovider.selectedMenuOption;
    //DBProvider.db.getSacnbyID(2).then((scan) => print(scan!.valor.toString()));
    // ignore: avoid_print
    //DBProvider.db.borrartodo().then(print);
    // final tempscan = ScanModel(valor: 'https://google.com');
    // final tempscan2 = ScanModel(valor: 'https://google.com');
    // final tempscan3 = ScanModel(valor: 'https://google.com');
    // DBProvider.db.nuevoScanRaw(tempscan);
    // DBProvider.db.nuevoScanRaw(tempscan2);
    // DBProvider.db.nuevoScanRaw(tempscan3);

    final scanListprovider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (indice) {
      case 0:
        scanListprovider.cargarscansportipo('geo');
        return const MapasPages();
      case 1:
        scanListprovider.cargarscansportipo('http');
        return const DireccionesPage();
      default:
        return const MapasPages();
    }
  }
}
