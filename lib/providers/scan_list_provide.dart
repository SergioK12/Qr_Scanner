import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tiposeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoscan = ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(nuevoscan);
    //asignar el Id de la base de datos al modelo
    nuevoscan.id = id;
    if (tiposeleccionado == nuevoscan.tipo) {
      scans.add(nuevoscan);
      notifyListeners();
    }

    return nuevoscan;
  }

  cargarscans() async {
    final scans = await DBProvider.db.getTodosSacns();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarscansportipo(String tipo) async {
    final scans = await DBProvider.db.getTodosSacnsporTipo(tipo);
    this.scans = [...scans];
    tiposeleccionado = tipo;
    notifyListeners();
  }

  borrarscansbyid(int id) async {
    await DBProvider.db.borrar(id);
    cargarscansportipo(tiposeleccionado);
  }

  borrartodos() async {
    await DBProvider.db.borrartodo();
    scans = [];
    notifyListeners();
  }
}
