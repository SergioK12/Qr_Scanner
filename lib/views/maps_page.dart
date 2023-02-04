import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provide.dart';

class MapasPages extends StatelessWidget {
  const MapasPages({super.key});

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
          leading:
              Icon(Icons.home_outlined, color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor.toString()),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.amber,
          ),
          // ignore: avoid_print
          onTap: () => print(scans[index].id.toString()),
        ),
      ),
    );
  }
}
