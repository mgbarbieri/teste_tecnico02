class Campo {
  final int linha;
  final int coluna;
  final int numero;

  final bool _cobra;
  final bool _escada;

  final int? _destino;

  Campo(this.linha, this.coluna, this.numero, this._cobra, this._escada,
      [this._destino]);

  bool get cobra {
    return _cobra;
  }

  bool get escada {
    return _escada;
  }

  int? get destino {
    return _destino;
  }
}
