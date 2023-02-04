import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provide.dart';

class ScannButton extends StatelessWidget {
  final Color? elcolor;
  const ScannButton({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanRes = 'http://sergio.com';
        final scanlistprovider = Provider.of<ScanListProvider>(context, listen: false);
        debugPrint(barcodeScanRes);

        scanlistprovider.nuevoScan(barcodeScanRes);
        scanlistprovider.nuevoScan('geo:45.00, 78.00');
        
        //scanlistprovider.nuevoScan('geo:15.33,16.99');
      },
      child: Icon(Icons.qr_code, color: elcolor ?? Colors.amber),
    );
  }
}
