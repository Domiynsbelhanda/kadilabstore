import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../globalsvariable.dart';

class UserProfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserProfil();
  }
}

class _UserProfil extends State<UserProfil> {

  final FocusNode myfocusUserName = FocusNode();
  final FocusNode numeroTelephone = FocusNode();
  final FocusNode myfocusVille = FocusNode();
  final FocusNode myfocusGenre = FocusNode();

  TextEditingController userNameController = new TextEditingController();
  TextEditingController numeroTelephoneController = new TextEditingController();
  TextEditingController villeController = new TextEditingController();
  TextEditingController genreController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        leading: backButton(context),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.black,
            ),
            onPressed: (){
              toast("Launch search delegate.");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profil',
                style: TextStyle(
                  fontSize: width(context) / 15
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Your mail Adress',
                style: TextStyle(
                  fontSize: width(context) / 20
                ),
              ),

              SizedBox(
                height: 15,
              ),

              TextField(
                focusNode: myfocusUserName,
                controller: userNameController,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nom d'Utilisateur",
                  hintStyle: TextStyle(
                      fontSize: 17.0
                  ),
                  suffixIcon: Icon(
                      FontAwesomeIcons.user,
                      size: 15.0,
                      color: Colors.black,
                    ),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                focusNode: numeroTelephone,
                controller: numeroTelephoneController,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Numero Téléphone",
                  hintStyle: TextStyle(
                      fontSize: 17.0
                  ),
                  suffixIcon: Icon(
                    FontAwesomeIcons.phone,
                    size: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                focusNode: myfocusVille,
                controller: villeController,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ville",
                  hintStyle: TextStyle(
                      fontSize: 17.0
                  ),
                  suffixIcon: Icon(
                    FontAwesomeIcons.city,
                    size: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                focusNode: myfocusGenre,
                controller: genreController,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Genre",
                  hintStyle: TextStyle(
                      fontSize: 17.0
                  ),
                  suffixIcon: Icon(
                    FontAwesomeIcons.userEdit,
                    size: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Center(child: button("Mettre à jour", (){}))
            ],
          ),
        ),
      ),
    );
  }
}