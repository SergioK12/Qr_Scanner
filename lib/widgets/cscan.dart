import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannButton extends StatelessWidget {
  final Color? elcolor;
  const ScannButton({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        debugPrint(barcodeScanRes);
      },
      child: Icon(Icons.qr_code, color: elcolor ?? Colors.amber),
    );
  }
}
