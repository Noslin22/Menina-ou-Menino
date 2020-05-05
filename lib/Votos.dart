class Votos{
  String _nome;
  String _voto;


  Votos(this._nome, this._voto);

  String get voto => _voto;

  set voto(String value) {
    _voto = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

}