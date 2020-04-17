import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteuniversitario/view/cardapio_view.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Apresentation(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
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
                  child: Align(
                    alignment: Alignment(-1, 0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Restaurante Universitário',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: 'RobotoSlab',
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Text(
                      'Cardápio Semanal',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontFamily: 'RobotoSlab'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    child: Text(
                      'Ecolha o dia da semana para consultar o cardápio.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _diaSemana('Segunda', context, "assets/images/img01.jpg"),
            _diaSemana('Terça', context, "assets/images/img02.jpg"),
            _diaSemana('Quarta', context, "assets/images/img03.jpg"),
            _diaSemana('Quinta', context, "assets/images/img04.jpg"),
            _diaSemana('Sexta', context, "assets/images/img05.jpg"),
          ],
        ),
      ),
    );
  }
}

class Apresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
            ],
          ),
          navigateAfterSeconds: HomeScreen(),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: Container(
            height: 400,
            width: 400,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Restaurante Universitário',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'RobotoSlab',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _diaSemana(String nomeDia, BuildContext context, String imgUrl) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CardapioScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgUrl),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 2.0),
                blurRadius: 10.0,
              ),
            ]),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            nomeDia,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black45,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
