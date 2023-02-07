import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanModel scanmodel = ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page'),
      ),
      body: Center(
        child: Text(scanmodel.valor),
      ),
    );
  }
}
