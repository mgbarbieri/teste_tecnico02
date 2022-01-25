import 'campo.dart';

Map<int, int> escadas = {
  2: 38,
  7: 14,
  8: 31,
  15: 26,
  21: 42,
  28: 84,
  36: 44,
  51: 67,
  71: 91,
  78: 98,
  87: 94
};
Map<int, int> cobras = {
  16: 6,
  49: 11,
  62: 19,
  46: 25,
  74: 53,
  64: 60,
  89: 68,
  95: 75,
  99: 80,
  92: 88
};

class Tabuleiro {
  final int linhas;
  final int colunas;
  final List<Campo> _campos = [];

  Tabuleiro(this.linhas, this.colunas) {
    _criarCampos();
  }

  void _criarCampos() {
    int numCampo = 1;
    for (int l = 0; l < linhas; l++) {
      if (l % 2 == 0) {
        for (int c = 0; c < colunas; c++) {
          if (escadas.containsKey(numCampo)) {
            _campos.add(Campo(l, c, numCampo, false, true, escadas[numCampo]));
          } else if (cobras.containsKey(numCampo)) {
            _campos.add(Campo(l, c, numCampo, true, false, cobras[numCampo]));
          } else {
            _campos.add(Campo(l, c, numCampo, false, false));
          }
          numCampo++;
        }
      } else {
        for (int c = colunas; c > 0; c--) {
          if (escadas.containsKey(numCampo)) {
            _campos.add(Campo(l, c, numCampo, false, true, escadas[numCampo]));
          } else if (cobras.containsKey(numCampo)) {
            _campos.add(Campo(l, c, numCampo, true, false, cobras[numCampo]));
          } else {
            _campos.add(Campo(l, c, numCampo, false, false));
          }
          numCampo++;
        }
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }
}
