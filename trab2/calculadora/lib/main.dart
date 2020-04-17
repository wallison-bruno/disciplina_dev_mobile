import 'package:calculadora/calculadora_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  CalculadoraController controller = CalculadoraController();

  Widget bildButton(String rotulo) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        child: Text(rotulo,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            )),
        onPressed: () {
          setState(() {
            controller.onPressComper(rotulo);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        backgroundColor: Colors.red,
      ), */
      body: Container(
        color: Colors.black87,
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: 60,
              right: 20,
            ),
            child: Text(
              controller.entrada,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                top: 15,
                right: 20,
              ),
              child: Text(
                controller.sub,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  bildButton('7'),
                  bildButton('8'),
                  bildButton('9'),
                  bildButton('C'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('4'),
                  bildButton('5'),
                  bildButton('6'),
                  bildButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('1'),
                  bildButton('2'),
                  bildButton('3'),
                  bildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('.'),
                  bildButton('0'),
                  bildButton('/'),
                  bildButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('='),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
