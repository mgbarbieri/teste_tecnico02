import 'campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final List<Campo> _campos = [];
  final List<Campo> data;

  Tabuleiro(this.linhas, this.colunas, this.data) {
    _criarCampos();
  }

  void _criarCampos() {
    int numCampo = 99;
    for (int l = 0; l < linhas; l++) {
      if (l % 2 == 0) {
        for (int c = 0; c < colunas; c++) {
          _campos.add(Campo(
              data[numCampo].numero,
              data[numCampo].cor,
              data[numCampo].escada,
              data[numCampo].cobra,
              data[numCampo].destino));
          numCampo--;
        }
      } else {
        numCampo = numCampo - 9;
        for (int c = colunas; c > 0; c--) {
          _campos.add(Campo(
              data[numCampo].numero,
              data[numCampo].cor,
              data[numCampo].escada,
              data[numCampo].cobra,
              data[numCampo].destino));
          numCampo++;
        }
        numCampo = numCampo - 11;
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }
}
