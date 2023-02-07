import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/util.dart';

import '../providers/scan_list_provide.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanlistprovider = Provider.of<ScanListProvider>(context);
    final scans = scanlistprovider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          scanlistprovider.borrarscansbyid(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            (tipo == 'http')
             ?Icons.wifi
             :Icons.maps_home_work,
             color: Theme.of(context).primaryColor
            ),
          title: Text(scans[index].valor.toString()),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.amber,
          ),
          // ignore: avoid_print
          onTap: () => launchurl(context, scans[index]),
        ),
      ),
    );
  }
}
