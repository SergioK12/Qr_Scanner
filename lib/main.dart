import 'package:flutter/material.dart';
import 'package:qr_scanner/views/home_page.dart';

void main() => runApp(const QrReader());

class QrReader extends StatelessWidget {
  const QrReader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Home',
      routes: {
        'Home':(context) => const HomePage()
      },
    );
  }
}