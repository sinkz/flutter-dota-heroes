import 'package:dota_app/model/dota_hero.dart';
import 'package:flutter/material.dart';

class DotaHeroDetails extends StatelessWidget {
  final DotaHero dotaHero;
  const DotaHeroDetails({Key key, @required this.dotaHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(dotaHero.name),
        ),
        body: 
        Container(
          // width: 300.00,
          height: 200.00,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://api.opendota.com" + dotaHero.imageURL))),
        ));
  }
}
