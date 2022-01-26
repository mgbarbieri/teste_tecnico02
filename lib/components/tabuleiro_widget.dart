import 'package:flutter/material.dart';
import 'package:teste_tecnico02/components/campo_widget.dart';
import 'package:teste_tecnico02/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;

  const TabuleiroWidget({Key? key, required this.tabuleiro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: tabuleiro.colunas,
      children: tabuleiro.campos
          .map((c) => CampoWidget(
                campo: c,
                cor: Color(int.parse(c.cor)),
              ))
          .toList(),
    );
  }
}
