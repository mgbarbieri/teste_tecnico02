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
  Jogador jogador1 = Jogador(true);
  Jogador jogador2 = Jogador(false);
  String? message = 'Toque nos dados para jogar';
  int dado1 = 1, dado2 = 1;
  List<String> imagemDados = [
    'assets/dado1.png',
    'assets/dado2.png',
    'assets/dado3.png',
    'assets/dado4.png',
    'assets/dado5.png',
    'assets/dado6.png',
  ];

  @override
  initState() {
    super.initState();
    loadJsonData();
  }

  int jogarDado() {
    return Random().nextInt(6) + 1;
  }

  void reset() {
    jogador1.casaAtual = 1;
    jogador1.rodadaAtual = true;
    jogador2.casaAtual = 1;
    jogador2.rodadaAtual = false;
  }

  void jogar(int dado1, int dado2) {
    bool direcao = true;
    if (jogador1.rodadaAtual) {
      for (int i = dado1 + dado2; i > 0; i--) {
        if (direcao) {
          jogador1.casaAtual++;
        } else {
          jogador1.casaAtual--;
        }

        setState(() {});

        if (jogador1.casaAtual == 100) {
          if (i == 1) {
            message = 'Jogador1 Venceu!';
            reset();
            break;
          } else {
            direcao = false;
          }
        }
      }
      if (dado1 == dado2) {
        message = 'Dados Iguais Jogador1 joga novamente!';
      } else {
        message = 'É a vez do Jogador2 agora!';
        jogador1.rodadaAtual = false;
        jogador2.rodadaAtual = true;
      }
      direcao = true;
    } else {
      for (int i = dado1 + dado2; i > 0; i--) {
        if (direcao) {
          jogador2.casaAtual++;
        } else {
          jogador2.casaAtual--;
        }

        setState(() {});

        if (jogador2.casaAtual == 100) {
          if (i == 1) {
            message = 'Jogador2 Venceu!';
            reset();
            break;
          } else {
            direcao = false;
          }
        }
      }
      if (dado1 == dado2) {
        message = 'Dados Iguais Jogador2 joga novamente!';
      } else {
        message = 'É a vez do Jogador1 agora!';
        jogador2.rodadaAtual = false;
        jogador1.rodadaAtual = true;
      }

      direcao = true;
    }
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
        body: Column(
          children: [
            Container(
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
            message != null
                ? Text(message!)
                : const SizedBox(
                    height: 16,
                  ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 480,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: jogador1.rodadaAtual
                          ? const BoxDecoration(color: Colors.blue)
                          : null,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/jogador1.png',
                            fit: BoxFit.fitWidth,
                          ),
                          Text('Casa: ${jogador1.casaAtual}')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () =>
                          jogar(dado1 = jogarDado(), dado2 = jogarDado()),
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                imagemDados[dado1 - 1],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                imagemDados[dado2 - 1],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: jogador2.rodadaAtual
                          ? const BoxDecoration(color: Colors.blue)
                          : null,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/jogador2.png',
                            fit: BoxFit.fitWidth,
                          ),
                          Text('Casa: ${jogador2.casaAtual}')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
