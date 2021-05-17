import 'package:adobe_xd/pinned.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/UI/Nouveaute.dart';
import 'package:kadilabstore/UI/PlusVues.dart';

import '../globalsvariable.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5.0,
                      child: Container(
                        width: width(context) / 1.5,
                        margin: EdgeInsets.all(width(context) / 25),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.search,
                              color: Colors.black,
                              size: width(context) / 20
                            ),

                            Container(
                              child: VerticalDivider(
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              'Rechercher un produit',
                              style: TextStyle(
                                fontFamily: 'Sergoe UI'
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      width: width(context) / 40,
                    ),

                    Card(
                      elevation: 5.0,
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: width(context) / 10,
                        width: width(context) / 10,
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: width(context) / 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: width(context) / 20,
              ),

              CarouselSlider(
                options: CarouselOptions(
                  height: width(context) / 2.2,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/image/image_1.png',
                  'assets/image/image_2.png',
                  'assets/image/image_3.jpg'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 5.0,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage(i),
                              fit: BoxFit.fitWidth,
                            )
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              SizedBox(
                height: width(context) / 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left:10.0, top: 10.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: width(context)/18
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Categorie(),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nouveauté',
                      style: TextStyle(
                        fontSize: width(context)/18,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return Nouveaute();
                            })
                        );
                      },
                      child: Text(
                        'voir tout',
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 5.0,
              ),

              Container(
                margin: EdgeInsets.only(left:10.0, right: 10.0),
                height: width(context) / 1.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                    return new GestureDetector(
                      child: item(articles[index], context)
                    );
                  },
                )
              ),


              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Les plus vendus',
                      style: TextStyle(
                          fontSize: width(context)/18,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return PlusVues();
                            })
                        );
                      },
                      child: Text(
                        'voir tout',
                      ),
                    )
                  ],
                ),
              ),

              Container(
                  margin: EdgeInsets.only(left:10.0, right: 10.0),
                  height: width(context) / 1.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    itemBuilder: (context, index){
                      return new GestureDetector(
                          child: item(articles[index], context)
                      );
                    },
                  )
              ),

              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  Widget Categorie(){
    return new Container(
        height:40.0,
        child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index){
            return new GestureDetector(
                child: new Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: new Container(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child:
                      new Stack(children: <Widget>[
                        new Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(image: AssetImage(categories[index].image), fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            )
                        ),

                        new Container(
                            decoration: BoxDecoration(
                              color: categories[index].color.withOpacity(0.8),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                        ),

                        new Center(child: new Text(
                          categories[index].nom,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 12.0
                          ),
                        ),),

                      ],
                      )
                  ),
                ),
            );
          },
        )
    );
  }
}