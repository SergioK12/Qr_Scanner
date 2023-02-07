import 'package:flutter/material.dart';
import '../widgets/scantiles.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}
