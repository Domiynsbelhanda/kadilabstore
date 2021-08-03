import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/models/Articles.dart';
import 'package:kadilabstore/models/ItemCard.dart';

import '../globalsvariable.dart';

class Details extends StatefulWidget{

  Articles item;
  Details({this.item});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Details();
  }
}

class _Details extends State<Details>{
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
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CarouselSlider(
                  options: CarouselOptions(
                    height: width(context) / 2.2,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: false,
                  ),
                  items: widget.item.image.map((i) {
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

                SizedBox(height: 15.0),

                Text(
                  '${widget.item.nom}',
                  style: TextStyle(
                    fontSize: width(context) / 12,
                  ),
                ),

                SizedBox(height: 10.0),

                Text(
                  '${widget.item.fabricant}',
                  style: TextStyle(
                    fontSize: width(context) / 15,
                    color: Colors.grey
                  ),
                ),

                SizedBox(height: 10.0),

                Text(
                  'CDF ${widget.item.prix}',
                  style: TextStyle(
                    fontSize: width(context) / 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue
                  ),
                ),

                SizedBox(height: 10.0),

                Divider(),

                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Categorie : ${widget.item.categorie}',
                        style: TextStyle(
                            fontSize: width(context) / 22
                        ),
                      ),

                      SizedBox(width: 20.0),

                      Text(
                        'Etat : ${widget.item.etat}',
                        style: TextStyle(
                          fontSize: width(context) / 22
                        ),
                      ),

                      VerticalDivider(),

                      SizedBox(width: 10),

                      Text(
                        '${widget.item.vue} vues',
                        style: TextStyle(
                          color: primaryColor
                        ),
                      )
                    ],
                  ),
                ),

                Divider(),

                SizedBox(height: 10.0,),

                Text(
                  'Description : ',
                  style: TextStyle(
                    fontSize: width(context) / 20
                  ),
                ),

                SizedBox(height: 10.0),

                Text(
                  '${widget.item.description}',
                  style: TextStyle(
                      fontSize: width(context) / 22
                  ),
                ),

                SizedBox(height: 10.0),

                Row(
                  children: [
                    FlatButton(
                        onPressed: (){
                          toast('Article ajouté');
                        },
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'ADD TO CARD'
                            ),
                          ),
                        )
                    ),

                    FlatButton(
                        onPressed: (){
                          toast('Commande effectuée');
                        },
                        child: Container(
                          color: Colors.lightBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                'COMMANDER',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}