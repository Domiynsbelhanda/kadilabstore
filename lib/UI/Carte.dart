import 'package:flutter/material.dart';
import 'package:kadilabstore/globalsvariable.dart';

class Carte extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Carte();
  }
}

class _Carte extends State<Carte>{

  double montant_total = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backButton(context),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panier',
                  style: TextStyle(
                    fontSize: width(context) / 15
                  ),
                ),

                SizedBox(
                  height: 10.0
                ),

                Container(
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: card.length,
                    itemBuilder: (context, index){
                      return new Container(
                        child: cardItem(card[index], context, index)
                      );
                    },
                  ),
                ),

                SizedBox(height:5.0),

                Text(
                  '${card.length} Article(s) = CDF $montant_total',
                  style: TextStyle(
                    fontSize: width(context) / 18
                  ),
                ),

                Center(child: button('Commander', (){
                  toast('Féliciations, votre commande a été effectué avec succès');
                }))
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget cardItem(itemCard, context, indice){
    return Container(
      child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 2.0, top: 10.0, bottom: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: AssetImage(
                            '${itemCard.image}'
                        ),
                        width: width(context) / 4,
                        height: width(context) / 3.8,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  SizedBox(width: 10.0),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        '${itemCard.nom}',
                        style: TextStyle(
                            fontSize: width(context) / 22
                        ),
                      ),

                      Text(
                        '${itemCard.fabricant}',
                        style: TextStyle(
                            fontSize: width(context) / 22,
                            color: Colors.grey
                        ),
                      ),

                      Text(
                        'CDF ${itemCard.prix}',
                        style: TextStyle(
                            fontSize: width(context) / 22,
                            color: Colors.blue
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){

                                      if(card[indice].nbre_art <= 1)
                                        {
                                          toast('Nombre Initiale');
                                       } else {
                                        setState(() {
                                          card[indice].nbre_art = card[indice].nbre_art - 1;
                                          prix_add();
                                        });
                                      }
                                    },
                                    child: Text(
                                        '-     ',
                                      style: TextStyle(
                                        fontSize: width(context) / 15
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '${itemCard.nbre_art}',
                                    style: TextStyle(
                                      fontSize: width(context) / 20
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      if(card[indice].nbre_art == 10){
                                        toast('Nombre limite atteint.');
                                      } else {
                                        setState(() {
                                          card[indice].nbre_art = card[indice].nbre_art + 1;
                                          prix_add();
                                        });
                                      }
                                    },
                                    child: Text(
                                      '     +',
                                      style: TextStyle(
                                          fontSize: width(context) / 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: width(context) / 10),

                          IconButton(
                            onPressed: (){
                              setState(() {
                                card.removeAt(indice);
                              });
                              toast('article supprimé');
                            },
                            icon: Icon(
                              Icons.close,
                              size: width(context) / 18,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ]
            ),
          )
      ),
    );
  }

  @override
  void initState() {
    prix_add();
  }

  prix_add(){
    montant_total = 0;
    for(var i in card){
      var prix = i.nbre_art * i.prix;
      montant_total += prix;
    }
  }
}