import 'package:flutter/material.dart';
import 'package:teste_tecnico02/models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;

  const CampoWidget({Key? key, required this.campo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 5,
      width: 5,
    );
  }
}
