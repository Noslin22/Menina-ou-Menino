import 'package:flutter/material.dart';
import 'Resultado.dart';

class Jogar extends StatefulWidget {
  @override
  _JogarState createState() => _JogarState();
}

class _JogarState extends State<Jogar> {

  void _votar(){
    final nome = _controllerNome.text;
    if(nome == "") {
      final snackBar = SnackBar(
        content: Text('Preencha o nome'),
        duration: Duration(milliseconds: 450),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }else if(nome == "admin"){

    }else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Resultado(nome)
          ));
      print("Nome: $nome");
    }
  }

  TextEditingController _controllerNome = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("imagens/titulo.png", height: 250,),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Digite seu nome:",
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.yellow,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: _votar,
                  child: Text(
                    "Votar",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(32),
          ),
          alignment: Alignment.center,
        )
    );
  }
}
