import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_tecnico02/components/tabuleiro_widget.dart';
import 'package:teste_tecnico02/models/campo.dart';
import 'package:teste_tecnico02/models/tabuleiro.dart';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();

  void jogar(int dado1, int dado2) {}
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  List _data = [];

  @override
  initState() {
    super.initState();
    loadJsonData();
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
                return Stack(
                  children: [
                    Container(
                      height: 480,
                      width: 480,
                      child: TabuleiroWidget(
                        tabuleiro: Tabuleiro(10, 10, _data as List<Campo>),
                      ),
                    ),
                    Positioned(
                      left: 280,
                      bottom: 10,
                      child: Transform.rotate(
                        angle: 270,
                        child: Image.asset(
                          'assets/ladder.png',
                          scale: 0.2,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 235,
                      bottom: 60,
                      child: Image.asset(
                        'assets/ladder.png',
                        scale: 0.2,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Positioned(
                      left: 85,
                      bottom: 10,
                      child: Transform.rotate(
                        angle: pi / 15,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 160,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 395,
                      bottom: -5,
                      child: Transform.rotate(
                        angle: pi / 4,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 140,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 100,
                      child: Transform.rotate(
                        angle: pi / 6,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 190,
                      bottom: 150,
                      child: Transform.rotate(
                        angle: pi / 1.5,
                        child: Image.asset(
                          'assets/ladder.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 70,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 250,
                      bottom: 80,
                      child: Transform.rotate(
                        angle: -pi / 5.5,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 360,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 90,
                      bottom: 200,
                      child: Transform.rotate(
                        angle: -pi / 2.5,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 170,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110,
                      top: 30,
                      child: Transform.rotate(
                        angle: pi / 30,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: Transform.rotate(
                        angle: -pi / 30,
                        child: Image.asset(
                          'assets/ladder2.png',
                          fit: BoxFit.fill,
                          width: 20,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 150,
                      top: 20,
                      child: Transform.rotate(
                        angle: -pi / 30,
                        child: Image.asset(
                          'assets/ladder.png',
                          fit: BoxFit.fill,
                          width: 30,
                          height: 60,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 20,
                      child: Image.asset('assets/snake1.png'),
                    ),
                    Positioned(
                      left: 350,
                      top: 70,
                      child: Image.asset('assets/snake2.png'),
                    ),
                    Positioned(
                      left: 350,
                      top: 20,
                      child: Image.asset('assets/snake3.png'),
                    ),
                    Positioned(
                      left: 230,
                      top: 20,
                      child: Transform.rotate(
                        angle: -pi / 4,
                        child: Image.asset(
                          'assets/snake5.png',
                          fit: BoxFit.fill,
                          height: 90,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 270,
                      top: 120,
                      child: Image.asset('assets/snake6.png'),
                    ),
                    Positioned(
                      left: 30,
                      top: 160,
                      child: Image.asset('assets/snake7.png'),
                    ),
                    Positioned(
                      left: 40,
                      top: 160,
                      child: Image.asset(
                        'assets/snake8.png',
                        fit: BoxFit.fill,
                        height: 250,
                      ),
                    ),
                    Positioned(
                      left: 180,
                      top: 260,
                      child: Image.asset('assets/snake9.png'),
                    ),
                    Positioned(
                      left: 190,
                      bottom: 20,
                      child: Image.asset('assets/snake10.png'),
                    ),
                    Positioned(
                      left: 370,
                      bottom: 70,
                      child: Image.asset(
                        'assets/snake11.png',
                        fit: BoxFit.fill,
                        height: 150,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
