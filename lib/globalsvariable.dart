import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './models/Categorie.dart';
import './models/Articles.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'UI/Details.dart';
import 'models/ItemCard.dart';

const primaryColor = Color(0xFF312783);

List articles = [
  Articles(
    nom: "PUCE ARDRUINO",
    fabricant: "Domi Yns",
    prix: 60.0,
    categorie: categories[2].nom,
    vue: 120,
    image: [
      'assets/image/raspberry.jpg',
      'assets/image/image_2.png',
      'assets/image/image_3.jpg'
    ],
    description: 'Article de première necessité, ...',
    etat: 'Bon'
  ),

  Articles(
    nom: "KADILAB Store",
    fabricant: "Youness Belhanda",
    prix: 55.0,
    categorie: categories[1].nom,
    vue: 110,
    image: [
      'assets/image/raspberry2.jpg',
      'assets/image/image_1.png',
      'assets/image/image_3.jpg'
    ],
    description: 'Article de première necessité, ...',
    etat: 'Bon'
  ),

  Articles(
    nom: "WWW.DOMIYNS.COM",
    fabricant: "Hada",
    prix: 40.0,
    categorie: categories[2].nom,
    vue: 90,
    image: [
      'assets/image/raspberry3.jpg',
      'assets/image/image_2.png',
      'assets/image/image_1.png'
    ],
    description: 'Article de première necessité, ...',
    etat: 'Bon'
  )
];

List <ItemCard>  card = [
  ItemCard(
    nom: articles[0].nom,
    fabricant: articles[0].fabricant,
    prix: articles[0].prix,
    image: articles[0].image[0],
    nbre_art: 1
  ),

  ItemCard(
      nom: articles[1].nom,
      fabricant: articles[1].fabricant,
      prix: articles[1].prix,
      image: articles[1].image[0],
      nbre_art: 4
  ),

  ItemCard(
      nom: articles[2].nom,
      fabricant: articles[2].fabricant,
      prix: articles[2].prix,
      image: articles[2].image[0],
      nbre_art: 6
  )
];

List <Categorie> categories = [
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
      width: width(context) / 15,
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
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.black,
      fontSize: 16.0
  );
}

Widget item(article, context, indice){
  return GestureDetector(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
        return Details(item: article);
      }));
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: AssetImage(
                    '${article.image[0]}'
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
    ),
  );
}