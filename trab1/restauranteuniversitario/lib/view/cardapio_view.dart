import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardapioScreen extends StatefulWidget {
  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(80),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: Offset(0.0, 2.0),
                      )
                      //alignment: Alignment(0.2, 0.6),
                    ]),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Cardápio da Segunda', //? Pode ficar o nome do dia que vier da HomeScreen
                          style: TextStyle(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 28,
                            fontFamily: 'RobotoSlab',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        alignment: Alignment(-1, 0),
                        child: Text(
                          'Manhã - Almoço',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'RobotoSlab',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 15),
                        child: Text(
                          '11:30 as 13:30',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RobotoSlab',
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  //* Bildar os cardes Aqui.
                  cardBilder(),
                  cardBilder(),
                  cardBilder(),
                  cardBilder(),
                  cardBilder(),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        alignment: Alignment(-1, 0),
                        child: Text(
                          'Noite - Janta',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'RobotoSlab',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 15),
                        child: Text(
                          '17:00 as 18:40',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RobotoSlab',
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  cardBilder(),
                  cardBilder(),
                  cardBilder(),
                  cardBilder(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardBilder() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            height: 100,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/img01.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Arroz',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          'Porção, 100 g',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '500 Cal',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
