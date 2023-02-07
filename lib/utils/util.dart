import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchurl(BuildContext context, ScanModel scan) async {
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  } else {
      Navigator.pushNamed(context, 'mapa', arguments: scan);
    }
}
