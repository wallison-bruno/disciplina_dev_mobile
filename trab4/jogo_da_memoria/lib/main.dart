import 'package:flutter/material.dart';
import 'component/animated_dialog_box.dart';
import 'component/imagens_game.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JogoMemoria(),
  ));
}

class JogoMemoria extends StatefulWidget {
  @override
  _JogoMemoriaState createState() => _JogoMemoriaState();
}

class _JogoMemoriaState extends State<JogoMemoria> {
  int pontos = 0;
  String img1 = '';
  String img2 = '';
  int id1 = 0;
  int id2 = 0;

  List<String> imgListComper;

  List<String> imgList = [
    Imagens.img1,
    Imagens.img2,
    Imagens.img3,
    Imagens.img4,
    Imagens.img1,
    Imagens.img2,
    Imagens.img3,
    Imagens.img4,
  ];

  @override
  void initState() {
    tempShow();
  }

  tempShow() async {
    super.initState();
    imgListComper = imgList;
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      imgListComper = ['', '', '', '', '', '', '', ''];
    });

    print(imgListComper);
  }

  setAll() {
    setState(() {
      imgListComper[id1] = '';
      imgListComper[id2] = '';
      img1 = '';
      img2 = '';
      id1 = 0;
      id2 = 0;
    });
  }

  bool isFinalized() {
    bool finalized = true;
    imgListComper.forEach((element) {
      if (element.isEmpty) {
        return finalized = false;
      }
    });
    return finalized;
  }

  comper(String imgUrl, int id) {
    if (img1.isEmpty) {
      setState(() {
        imgListComper[id] = imgUrl;
        img1 = imgUrl;
        id1 = id;
      });
    } else {
      setState(() {
        imgListComper[id] = imgUrl;
        img2 = imgUrl;
        id2 = id;
      });

      if (img1 == img2 && id1 != id2) {
        setState(() {
          imgListComper[id1] = img1;
          imgListComper[id2] = img2;
          pontos++;
          img1 = '';
          img2 = '';
          id1 = 0;
          id2 = 0;
        });
      } else {
        pontos--;
        setAll();
      }
    }
    setState(() {
      if (isFinalized() == true) {
        boxAnimation(context);
      }
    });
  }

  Widget bildImage(int id) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          // color: Colors.white,
          height: 300,
          width: 300,
          child: GestureDetector(
            child: Image(
              image: AssetImage(imgListComper[id]),
              fit: BoxFit.cover,
            ),
            onTap: () {
              comper(imgList[id], id);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Text(
            pontos.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  imgListComper = ['', '', '', '', '', '', '', ''];
                  pontos = 0;
                  setAll();
                });
              },
              child: Icon(
                Icons.settings_backup_restore,
                size: 40.0,
                color: Colors.amber,
              ),
            ),
          ),
        ],
        title: Text(
          'Jogo da Memória',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 20),
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage(0),
                  bildImage(1),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage(2),
                  bildImage(3),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage(4),
                  bildImage(5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage(6),
                  bildImage(7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> boxAnimation(BuildContext context) async {
    return await Animated_dialog_box.showRotatedAlert(
      title: Center(
          child: Text(pontos <= 0 ? "Não foi dessa Vez!!!" : 'PARABÉNS!!!')),
      context: context,
      firstButton: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.white,
        child: Text('Ok'),
        onPressed: () {
          Navigator.of(context).pop();
          imgListComper = ['', '', '', '', '', '', '', ''];
          pontos = 0;
          setAll();
        },
      ),
      icon: Icon(
        Icons.games,
        color: Colors.blue,
      ),
      yourWidget: Container(
        child: Text(
            'Sua pontuação foi: $pontos\nPrecione OK para reiniciar o jogo!'),
      ),
    );
  }
}
