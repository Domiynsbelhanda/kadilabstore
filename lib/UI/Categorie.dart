import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadilabstore/models/Categorie.dart';

import '../globalsvariable.dart';
import 'Details.dart';

class Categories extends StatefulWidget{

  String categorie;

  Categories({this.categorie});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Categories(cat: categorie);
  }
}

class _Categories extends State<Categories>{

  String cat;
  _Categories({this.cat});

  int tag;
  int tague = 0;
  List <Categorie> options = categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(cat == null){
      tag = 0;
    } else {
      for (var element in options){
        if(element.nom == cat){
          tag = tague;
        }
        tague += 1;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Container(
              width: width(context) / 4,
              height: double.infinity,
              child: ChipsChoice<int>.single(
                value: tag,
                onChanged: (val) => setState(() => tag = val),
                choiceItems: C2Choice.listFrom<int, Categorie>(
                  source: options,
                  value: (i, v) => i,
                  label: (i, v) => v.nom,
                ),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                choiceBuilder: (item) {
                  return CustomChip(
                      label: item.label,
                      width: width(context) / 4,
                      height: width(context) / 4,
                      color: Colors.redAccent,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      selected: item.selected,
                      onSelect: item.select
                  );
                },
                direction: Axis.vertical,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${options[tag].nom}',
                      style: TextStyle(
                          fontSize: width(context) / 15
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: articles.where((element) => element.categorie == options[tag].nom).toList().length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: (0.65)
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          child: items(
                              articles.where((element) => element.categorie == options[tag].nom).toList()[index],
                              context,
                            index
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}

Widget items(article, context, indice){
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
                width: width(context) / 3,
                height: width(context) / 3,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Text(
              '\$ ${article.prix}',
            style: TextStyle(
              fontSize: width(context) / 20
            ),
          ),

          SizedBox(
            height: 2.0,
          ),

          Text(
              '${article.nom}',
            style: TextStyle(
                fontSize: width(context) / 30
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomChip extends StatelessWidget {

  final String label;
  final Color color;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final bool selected;
  final Function(bool selected) onSelect;

  CustomChip({
    Key key,
    this.label,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.selected,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: this.width,
      height: this.height,
      margin: margin ?? const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: selected ? (color ?? Colors.green) : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(selected ? 25 : 10)),
        border: Border.all(
          color: selected ? (color ?? Colors.green) : Colors.grey,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => onSelect(!selected),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Visibility(
                visible: selected,
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 32,
                )
            ),
            Positioned(
              left: 9,
              right: 9,
              bottom: 7,
              child: Container(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}