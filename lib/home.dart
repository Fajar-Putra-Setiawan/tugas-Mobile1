import 'package:flutter/material.dart';
import 'package:calculator_sederhana/kalkulator.dart';
import 'package:calculator_sederhana/login.dart';
import 'datakelompok.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/monkey.png'),
            fit: BoxFit.fill,  
          ),
        ),
    ),
    );
  }

////////////////////////////////////////////////////////////
}


