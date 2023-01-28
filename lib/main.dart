import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/views/home_page.dart';

void main() => runApp(const QrReader());

class QrReader extends StatelessWidget {
  const QrReader({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'Home',
        routes: {'Home': (context) => const HomePage()},
      ),
    );
  }
}
