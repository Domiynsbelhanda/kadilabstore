import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/globalsvariable.dart';

class Nouveaute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Nouveaute();
  }
}

class _Nouveaute extends State<Nouveaute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Nouveauté',
                  style: TextStyle(
                    fontSize: width(context) / 15
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: (0.65)
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      child: item(articles[index], context),
                    ),
                  ),
                ),
              )
            ],
          )
    );
  }
}