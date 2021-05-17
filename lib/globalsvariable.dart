import 'package:flutter/material.dart';
import './models/Categorie.dart';
import './models/Articles.dart';
import 'package:fluttertoast/fluttertoast.dart';

const primaryColor = Color(0xFF312783);

List articles = [
  Articles(
    nom: "PUCE ARDRUINO",
    prix: 60.0,
    categorie: categories[0].nom,
    vue: 120,
    image: 'assets/image/image_1.png'
  ),

  Articles(
    nom: "KADILAB Store",
    prix: 55.0,
    categorie: categories[1].nom,
    vue: 110,
    image: 'assets/image/image_2.png'
  ),

  Articles(
    nom: "WWW.DOMIYNS.COM",
    prix: 40.0,
    categorie: categories[2].nom,
    vue: 90,
    image: 'assets/image/image_3.jpg'
  )
];

List categories = [
  Categorie(
      nom: 'Puce',
      image: 'assets/image/image_1.png',
      color: Colors.blue
  ),

  Categorie(
      nom: 'Ardruino',
      image: 'assets/image/image_2.png',
      color: Colors.red
  ),

  Categorie(
      nom: 'Bluethooth',
      image: 'assets/image/image_3.jpg',
      color: Colors.green
  )
];

double width(context){
  return MediaQuery.of(context).size.width;
}

double height (context){
  return MediaQuery.of(context).size.height;
}

Widget button(String titre ,action()){
  return FlatButton(
      onPressed: () => action(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [
              primaryColor,
              const Color(0xff64b6ff)
            ],
            stops: [0.0, 1.0],
          ),
        ),

        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              titre,
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xffffffff),
                letterSpacing: -0.3858822937011719,
              ),
              textAlign: TextAlign.center,
            )
        ),
      )
  );
}

Widget backButton(context){
  return FlatButton(
    child: Image(
      image: AssetImage(
          'assets/image/left-arrow.png'
      ),
      width: width(context) / 20,
    ),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}

toast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.black,
      fontSize: 16.0
  );
}

Widget item(article, context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              image: AssetImage(
                  '${article.image}'
              ),
              width: width(context) / 2.6,
              height: width(context) / 2,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),

        SizedBox(
          height: 10.0,
        ),

        Text(
            '\$ ${article.prix}'
        ),

        SizedBox(
          height: 2.0,
        ),

        Text(
            '${article.nom}'
        ),
      ],
    ),
  );
}