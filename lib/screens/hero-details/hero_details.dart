import 'package:dota_app/model/dota_hero.dart';
import 'package:dota_app/screens/hero-details/widgets/hero-text-detail.dart';
import 'package:flutter/material.dart';
class DotaHeroDetails extends StatelessWidget {
  final DotaHero dotaHero;
  const DotaHeroDetails({Key key, @required this.dotaHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Hero Details"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 200.00,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://api.opendota.com" + dotaHero.imageURL))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(dotaHero.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Image.network(
                      "https://api.opendota.com" + dotaHero.icon,
                      fit: BoxFit.fill),
                ),
              ],
            ),
            Divider(),
            HeroTextDetail(baseAttr: dotaHero.baseAgi, description: "Base Agi: ", color: Colors.green),
            HeroTextDetail(baseAttr: dotaHero.baseInt, description: "Base Int: ", color: Colors.blue),
            HeroTextDetail(baseAttr: dotaHero.baseStr, description: "Base Str: ", color: Colors.red),
          ],
        ));
  }
}
