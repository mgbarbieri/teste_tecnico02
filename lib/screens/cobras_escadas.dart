import 'package:flutter/material.dart';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();

  void jogar(int dado1, int dado2) {}
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Cobras e Escadas')),
        ),
        body: Container(
          child: const Text('Tabuleiro'),
        ),
      ),
    );
  }
}
