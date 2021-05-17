import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/globalsvariable.dart';

class Authentification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Authentification();
  }
}

class _Authentification extends State<Authentification>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  TextEditingController loginemailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(width(context) / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Authentification",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: width(context) / 15
                ),
              ),

              SizedBox(
                height: 15.0
              ),

              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        focusNode: myFocusNodeEmailLogin,
                        controller: loginemailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.black,
                            size: 22.0,
                          ),
                          hintText: "Email",
                        ),
                      ),

                      SizedBox(
                        height: 15.0
                      ),


                      TextField(
                            focusNode: myFocusNodePasswordLogin,
                            controller: loginPasswordController,
                            obscureText: _obscureTextLogin,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                size: 22.0,
                                color: Colors.black,
                              ),
                              hintText: "Mot de passe",
                              hintStyle: TextStyle(
                                  fontSize: 17.0
                              ),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(
                                  _obscureTextLogin
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.0
              ),

              Center(
                child: button("CONNEXION", (){
                  if(
                  loginemailController.text.isEmpty
                      || loginPasswordController.text.isEmpty){
                    toast("Completez toute les cases correctement.");
                  } else if (loginPasswordController.text.length < 6){
                    toast("Mot de passe trop court");
                  }
                  else {

                  }
                }),
              )
            ],
          ),
        )
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

}