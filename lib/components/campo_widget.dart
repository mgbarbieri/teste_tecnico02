import 'package:flutter/material.dart';
import 'package:teste_tecnico02/models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final Color cor;
  bool jogador1;
  bool jogador2;

  CampoWidget(
      {Key? key,
      required this.campo,
      required this.cor,
      this.jogador1 = false,
      this.jogador2 = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Text(
            campo.numero.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (jogador1)
            Image.asset(
              'assets/jogador1.png',
              fit: BoxFit.fill,
            ),
          if (jogador2)
            Image.asset(
              'assets/jogador2.png',
              fit: BoxFit.fill,
            ),
        ],
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black), color: cor),
    );
  }
}
