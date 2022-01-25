import 'package:flutter/material.dart';

class CobrasEscadasApp extends StatefulWidget {
  const CobrasEscadasApp({Key? key}) : super(key: key);

  @override
  _CobrasEscadasAppState createState() => _CobrasEscadasAppState();
}

class _CobrasEscadasAppState extends State<CobrasEscadasApp> {
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
