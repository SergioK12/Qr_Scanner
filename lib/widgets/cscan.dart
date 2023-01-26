import 'package:flutter/material.dart';

class ScannButton extends StatelessWidget {
  final Color? elcolor ;
  const ScannButton({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child:  Icon(Icons.qr_code, color: elcolor ?? Colors.amber),
      onPressed: () {},
    );
  }
}
