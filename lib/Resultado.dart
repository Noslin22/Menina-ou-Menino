import 'package:flutter/material.dart';
import 'package:meninooumenina/Lista.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resultado extends StatefulWidget {
  final _usuario;

  Resultado(this._usuario);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  void _abrirListaMenina() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Lista()));
    WidgetsFlutterBinding.ensureInitialized();
    Firestore db = Firestore.instance;
    db.collection("Votos").add({"Nome": widget._usuario, "Voto": "Menina"});
  }

  void _abrirListaMenino() {
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Lista()));
    WidgetsFlutterBinding.ensureInitialized();
    Firestore db = Firestore.instance;
    db.collection("Votos").add({"Nome": widget._usuario, "Voto": "Menino"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("Votos")
                        .where("Voto", isEqualTo: "Menina")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.hasError) {
                        return new Text('Erro: ${querySnapshot.error}');
                      }
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        final list = querySnapshot.data.documents;
                        print("Votos $list");
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            list.length.toString(),
                            style: TextStyle(fontSize: 35, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.all(5),
                        );
                      }
                    }),
                Tooltip(
                  message: "Menina",
                  child: Image.asset("imagens/menina.png"),
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Tem certeza",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          titleTextStyle: TextStyle(color: Colors.white),
                          backgroundColor: Colors.pinkAccent,
                          titlePadding: EdgeInsets.all(8),
                          content: Text(
                            "Você não poderá voltar",
                            textAlign: TextAlign.center,
                          ),
                          contentTextStyle: TextStyle(color: Colors.white),
                          actions: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _abrirListaMenina();
                                  },
                                  child: Text("Sim",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                FlatButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Não",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Menina",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("Votos")
                        .where("Voto", isEqualTo: "Menino")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.hasError) {
                        return new Text('Erro: ${querySnapshot.error}');
                      }
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        var list = querySnapshot.data.documents;
                        print("Votos $list");
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            list.length.toString(),
                            style: TextStyle(fontSize: 35, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.all(5),
                        );
                      }
                    }),
                Tooltip(
                  message: "Menino",
                  child: Image.asset("imagens/menino.png"),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Tem certeza",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          titleTextStyle: TextStyle(color: Colors.white),
                          backgroundColor: Colors.lightBlue,
                          titlePadding: EdgeInsets.all(8),
                          content: Text("Você não poderá voltar",
                              textAlign: TextAlign.center),
                          contentTextStyle: TextStyle(color: Colors.white),
                          actions: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _abrirListaMenino();
                                  },
                                  child: Text("Sim",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                FlatButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Não",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Menino",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
