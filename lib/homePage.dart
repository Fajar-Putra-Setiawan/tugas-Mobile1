import 'package:flutter/material.dart';
import 'package:calculator_sederhana/home.dart';
import 'package:calculator_sederhana/kalkulator.dart';
import 'package:calculator_sederhana/login.dart';
import 'datakelompok.dart';


class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int currentIndex = 0;
  final screens = [
    Home(),
    MyHomePage(),
    CalculatorApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome, User"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }), (route) => false,
            );
          },),
        ],
      ),

    body: screens[currentIndex],

    
    bottomNavigationBar : BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Data',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'Calculator',
        ),
      ],
    ),
      

    );
  }

////////////////////////////////////////////////////////////
}


