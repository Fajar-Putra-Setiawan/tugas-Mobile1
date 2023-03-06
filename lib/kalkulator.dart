import 'package:flutter/material.dart';
import 'package:calculator_sederhana/homePage.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _currentNumber = '';
  String _operand = '';
  late double _firstNumber;
  bool _reset = false;

  void _handleButtonClick(String buttonText) {
    if (buttonText == 'C') {
      _output = '';
      _currentNumber = '';
      _operand = '';
      _firstNumber = 0;
      _reset = false; 
    } else if (buttonText == '+/-') {
      double number = double.parse(_currentNumber);
      _currentNumber = (number * -1).toString();
      _output = _currentNumber;
    } else if (buttonText == '%') {
      double number = double.parse(_currentNumber);
      _currentNumber = (number / 100).toString();
      _output = _currentNumber;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      _operand = buttonText;
      _firstNumber = double.parse(_currentNumber);
      _currentNumber = '';
      _output = _firstNumber.toString() + ' ' + _operand;
    } else if (buttonText == '.') {
      if (_currentNumber.contains('.')) {
        return;
      }
      _currentNumber += buttonText;
      _output = _currentNumber;
    } else if (buttonText == '=') {
      double secondNumber = double.parse(_currentNumber);
      switch (_operand) {
        case '+':
          _currentNumber = (_firstNumber + secondNumber).toString();
          break;
        case '-':
          _currentNumber = (_firstNumber - secondNumber).toString();
          break;
        case 'x':
          _currentNumber = (_firstNumber * secondNumber).toString();
          break;
        case '/':
          _currentNumber = (_firstNumber / secondNumber).toString();
          break;
      }
      _operand = '';
      _firstNumber = 0;
      _output = _currentNumber;
      _reset = true;
    } else {
      if (_reset) {
        _currentNumber = buttonText;
        _reset = false;
      } else {
        _currentNumber += buttonText;
      }
      _output = _currentNumber;
    }

    setState(() {
      _output = _output;
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: FlatButton(
        onPressed: () => _handleButtonClick(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: buttonColor,
        padding: EdgeInsets.all(24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: 6 , vertical: 50),
      child: Text(
        _output,
        style: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton('C', Colors.grey),
          _buildButton('+/-', Colors.grey),
          _buildButton('%', Colors.grey),
          _buildButton('/', Colors.orange),
        ],
      ),
    ),
    Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton('7', Colors.blueGrey),
          _buildButton('8', Colors.blueGrey),
          _buildButton('9', Colors.blueGrey),
          _buildButton('x', Colors.orange),
        ],
      ),
    ),
    Expanded(
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton('4', Colors.blueGrey),
          _buildButton('5', Colors.blueGrey),
          _buildButton('6', Colors.blueGrey),
          _buildButton('-', Colors.orange),
        ],
      ),
    ),
    Expanded(
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton('1', Colors.blueGrey),
          _buildButton('2', Colors.blueGrey),
          _buildButton('3', Colors.blueGrey),
          _buildButton('+', Colors.orange),
        ],
      ),
    ),
    Expanded(
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton('0', Colors.blueGrey),
          _buildButton('.', Colors.blueGrey),
          _buildButton('=', Colors.orange),
        ],
      ),
    ),
    ],
    ),
    );
  }
}

