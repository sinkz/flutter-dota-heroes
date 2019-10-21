import 'package:dota_app/model/attr_color_helper.dart';
import 'package:dota_app/screens/hero-details/hero_details.dart';
import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import '../../services/dota_hero_service.dart';
import '../../model/dota_hero.dart';

class DotaHeroSnap extends StatefulWidget {
  @override
  _DotaHeroSnapState createState() => _DotaHeroSnapState();
}

class _DotaHeroSnapState extends State<DotaHeroSnap> {
  List<DotaHero> _heroes = <DotaHero>[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    listenForHeroes();
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      _heroes = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(300.0, 350.0);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SnapList(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width - cardSize.width) / 2),
            sizeProvider: (index, data) => cardSize,
            separatorProvider: (index, data) => Size(10.0, 10.0),
            builder: (context, index, data) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            DotaHeroDetails(dotaHero: _heroes[index]),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ));
                },
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(16.0),
                      child: Image.network(
                        "https://api.opendota.com" + _heroes[index].imageURL,
                        fit: BoxFit.cover,
                        height: 300.0,
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          _heroes[index].name,
                          style: TextStyle(
                              fontSize: 25.5,
                              fontWeight: FontWeight.bold,
                              color: AttrColorHelper.getValue(
                                  _heroes[index].attr)),
                        )),
                  ],
                ),
              );
            },
            count: _heroes.length,
          );
  }

  void listenForHeroes() async {
    setState(() {
      isLoading = true;
    });
    final List<DotaHero> heroes = await getDotaHeroes();
    setState(() {
      _heroes = heroes;
      isLoading = false;
    });
    //  heroes.map((hero) => setState(() => _heroes.add(hero)));
    print(_heroes);
  }
}
