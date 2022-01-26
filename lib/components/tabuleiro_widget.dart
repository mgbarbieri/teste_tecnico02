import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste_tecnico02/components/campo_widget.dart';
import 'package:teste_tecnico02/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;

  const TabuleiroWidget({Key? key, required this.tabuleiro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 480,
          width: 480,
          child: GridView.count(
            crossAxisCount: tabuleiro.colunas,
            children: tabuleiro.campos
                .map((c) => CampoWidget(
                      campo: c,
                      cor: Color(int.parse(c.cor)),
                    ))
                .toList(),
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
}
