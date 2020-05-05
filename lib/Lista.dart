import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Lista extends StatefulWidget {
  Lista();

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Votos"),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Row(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 100,
                                          child: Center(
                                            child: Row(
                                              children: <Widget>[
                                                Text(list[index]["Nome"],
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                      list[index]["Voto"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: list[index][
                                                                      "Voto"] ==
                                                                  "Menino"
                                                              ? Colors
                                                                  .blueAccent
                                                              : Colors
                                                                  .pinkAccent)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: list.length,
                            ),
                            flex: 9,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(3.1),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "Menino ${list.length.toString()}",
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.lightBlue),
                                    textAlign: TextAlign.center,
                                  ),
                                  padding: EdgeInsets.all(5),
                                )),
                            flex: 1,
                          )
                        ],
                      );
                    }
                  }),
              flex: 1,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 100,
                                          child: Center(
                                            child: Row(
                                              children: <Widget>[
                                                Text(list[index]["Nome"],
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                      list[index]["Voto"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: list[index][
                                                                      "Voto"] ==
                                                                  "Menino"
                                                              ? Colors
                                                                  .blueAccent
                                                              : Colors
                                                                  .pinkAccent)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: list.length,
                            ),
                            flex: 9,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.1),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Menina ${list.length.toString()}",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.pinkAccent),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            flex: 1,
                          )
                        ],
                      );
                    }
                  }),
              flex: 1,
            ),
          ],
        ));
  }
}
