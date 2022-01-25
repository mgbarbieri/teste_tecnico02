class Campo {
  final int linha;
  final int coluna;

  bool _cobra;
  bool _escada;

  Campo? _destino;

  Campo(this.linha, this.coluna, this._cobra, this._escada);

  bool get cobra {
    return _cobra;
  }

  bool get escada {
    return _escada;
  }
}
