import 'package:flutter/material.dart';

class StickyNote extends StatelessWidget {
  final String text;

  StickyNote({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StickyNote(text: "Fajar Putra Setiawan - 123200092" ),
            StickyNote(text: "Muhammad Iqbal Habil - 123200110 "),
          ],
        ),
      ),
    );
  }
}
