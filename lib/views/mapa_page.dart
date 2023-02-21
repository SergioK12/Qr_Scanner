import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scanner/models/scan_model.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    Set<Marker> markes = <Marker>{};

    markes.add(Marker(
        markerId: const MarkerId('geolocation'), position: scan.getlatmg()));

    CameraPosition puntoInicial =
        CameraPosition(target: scan.getlatmg(), zoom: 14.4746);

    final Completer<GoogleMapController> controllerx =
        Completer<GoogleMapController>();

    var maptype = MapType.normal;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await controllerx.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: scan.getlatmg(), zoom: 17.33)));
              },
              icon: const Icon(Icons.location_history))
        ],
      ),
      body: GoogleMap(
        markers: markes,
        mapType: MapType.satellite,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          controllerx.complete(controller);
        },
      ),
    );
  }
}
