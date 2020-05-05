import 'package:flutter/material.dart';
import 'package:meninooumenina/Jogar.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Home());

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jogar(),
    );
  }
}
