import 'package:adobe_xd/pinned.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/UI/Categorie.dart';
import 'package:kadilabstore/UI/Nouveaute.dart';
import 'package:kadilabstore/UI/PlusVues.dart';

import '../globalsvariable.dart';
import 'Accueil.dart';
import 'Carte.dart';
import 'Details.dart';
import 'User_Profil.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  int _currentIndex = 0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _currentIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Accueil'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.folderOpen),
                title: Text('Categorie'),
                activeColor: Colors.purpleAccent
            ),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.cartPlus),
                title: Text('Panier'),
                activeColor: Colors.pink
            ),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.user),
                title: Text('Mon Compte'),
                activeColor: Colors.blue
            ),
          ],
        ),
        body: pages.elementAt(_currentIndex)
    );
  }

  List pages = [
    Home(),
    Categories(),
    Carte(),
    UserProfil()
  ];

  @override
  void initState() {
    super.initState();
  }
}