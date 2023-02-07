import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scantiles.dart';

class MapasPages extends StatelessWidget {
  const MapasPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}
