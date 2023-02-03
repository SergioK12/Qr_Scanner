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
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title:  Text(scans[index].valor.toString()),
        subtitle:  Text(scans[index].id.toString()),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.amber,
        ),
        onTap: () => print(scans[index].id.toString()),
      ),
    );
  }
}
