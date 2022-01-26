import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_tecnico02/components/tabuleiro_widget.dart';
import 'package:teste_tecnico02/models/campo.dart';
import 'package:teste_tecnico02/models/jogador.dart';
import 'package:teste_tecnico02/models/tabuleiro.dart';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  List _data = [];
  //Jogador jogador1, jogador2;

  @override
  initState() {
    super.initState();
    loadJsonData();
  }

  int jogarDado() {
    return Random().nextInt(5) + 1;
  }

  void jogar(int dado1, int dado2) {
    setState(() {});
  }

  Future<String> loadJsonData() async {
    var response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    setState(() {
      _data = data['Campos'];
      _data = _data.map((e) => Campo.fromJson(e)).toList();
    });

    return 'Data loaded';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Cobras e Escadas')),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: FutureBuilder(
            future: loadJsonData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return TabuleiroWidget(
                  tabuleiro: (Tabuleiro(10, 10, _data as List<Campo>)),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
