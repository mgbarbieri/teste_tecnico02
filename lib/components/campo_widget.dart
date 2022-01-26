import 'package:flutter/material.dart';
import 'package:teste_tecnico02/models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final Color cor;

  const CampoWidget({Key? key, required this.campo, required this.cor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        campo.numero.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black), color: cor),
    );
  }
}
