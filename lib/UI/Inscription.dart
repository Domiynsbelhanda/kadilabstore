import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/globalsvariable.dart';

class Inscription extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Inscription();
  }
}

class _Inscription extends State<Inscription>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();
  final FocusNode myFocusNodePhone = FocusNode();

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupPhoneController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController = new TextEditingController();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

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
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
              padding: EdgeInsets.all(width(context) / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inscription",
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
                            focusNode: myFocusNodeName,
                            controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              hintText: "Nom",
                              hintStyle: TextStyle(
                                  fontSize: 16.0),
                            ),
                          ),

                          SizedBox(
                              height: 15.0
                          ),


                          TextField(
                            focusNode: myFocusNodeEmail,
                            controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                              ),
                              hintText: "Adresse Mail",
                              hintStyle: TextStyle(
                                  fontSize: 16.0),
                            ),
                          ),

                          SizedBox(
                              height: 15.0
                          ),

                          TextField(
                            focusNode: myFocusNodePhone,
                            controller: signupPhoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                              ),
                              hintText: "N° Téléphone",
                              hintStyle: TextStyle(
                                  fontSize: 16.0),
                            ),
                          ),

                          SizedBox(
                              height: 15.0
                          ),


                          TextField(
                            focusNode: myFocusNodePassword,
                            controller: signupPasswordController,
                            obscureText: _obscureTextSignup,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Mot de passe",
                              hintStyle: TextStyle(
                                  fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  _obscureTextSignup
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),

                      SizedBox(
                          height: 15.0
                      ),


                      TextField(
                        controller: signupConfirmPasswordController,
                        obscureText: _obscureTextSignupConfirm,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black),
                        decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Confirmation mot de passe",
                          hintStyle: TextStyle(
                              fontSize: 16.0),
                          suffixIcon: GestureDetector(
                            onTap: _toggleSignupConfirm,
                            child: Icon(
                              _obscureTextSignupConfirm
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        )
                        ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 20.0
                  ),

                  Center(
                    child: button("INSCRIPTION", (){
                      if(signupNameController.text.isEmpty ||
                      signupPasswordController.text.isEmpty ||
                      signupConfirmPasswordController.text.isEmpty ||
                      signupPhoneController.text.isEmpty ||
                      signupEmailController.text.isEmpty)
                      {
                      toast("Completez toute les cases");
                      }
                      else if (signupPasswordController.text.length < 6){
                      toast("Mot de passe trop court");}
                      else if (signupConfirmPasswordController.text != signupPasswordController.text)
                      {
                      toast("Mot de passe de confirmation différent");
                      }
                        else {

                        }}
                      ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

}