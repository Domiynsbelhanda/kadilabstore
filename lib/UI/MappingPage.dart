import 'package:flutter/material.dart';
import 'package:kadilabstore/UI/Inscription.dart';
import 'package:kadilabstore/globalsvariable.dart';

import 'Authentification.dart';

class MappingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MappingPage();
  }
}

class _MappingPage extends State<MappingPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/image/logo.png',
                ),
                width: width(context) / 2,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'KADILAB Store',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: width(context) / 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: width(context) / 8,),

              button("Connexion", (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return Authentification();
                    })
                );
              }),

              SizedBox(height: height(context) / 100,),

              button("Inscription", (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return Inscription();
                    })
                );
              })
            ],
          ),
        ),
      ),
    );
  }

}