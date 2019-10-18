import 'package:flutter/material.dart';
import '../model/dota_hero.dart';
import '../screens/hero-details/hero_details.dart';

class DotaHeroItem extends StatelessWidget {
  final DotaHero _dotaHero;
  DotaHeroItem(this._dotaHero);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: Text(_dotaHero.name),
            subtitle: Text("Type: " + _dotaHero.attr),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DotaHeroDetails(dotaHero:  _dotaHero)),
              );
            },
            leading: Container(
              height: 65.0,
              width: 60.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                          "https://api.opendota.com" + _dotaHero.imageURL))),
              // child: Image.network("https://api.opendota.com"+_dotaHero.imageURL, height: 70.0, fit: BoxFit.fill)
            ),
          ),
          Divider()
        ],
      );
}
