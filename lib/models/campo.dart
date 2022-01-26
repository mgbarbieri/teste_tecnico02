class Campo {
  final int numero;
  final String cor;

  final bool _cobra;
  final bool _escada;

  final int? _destino;

  Campo(this.numero, this.cor, this._escada, this._cobra, [this._destino]);

  factory Campo.fromJson(Map<String, dynamic> json) {
    return Campo(json['NumeroCampo'] as int, json['Cor'], json['Escada'],
        json['Cobra'], json['CampoDestino'] as int?);
  }

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
