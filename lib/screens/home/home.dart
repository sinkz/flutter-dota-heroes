import 'package:flutter/material.dart';
import '../../services/dota_hero_service.dart';
import '../../model/dota_hero.dart';
import '../../widgets/dota_hero_item.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DotaHero> _heroes = <DotaHero>[];
  @override
  void initState() {
    super.initState();
    listenForHeroes();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Dota Heroes'),
    ),
    body: ListView.builder(
      itemExtent: 100.0,
      itemCount: _heroes.length,
      itemBuilder: (context, index) => DotaHeroItem(_heroes[index]),
    ),
  );

  void listenForHeroes() async {
     final List<DotaHero> heroes = await getDotaHeroes();
     setState(() {
       _heroes = heroes;
     });
    //  heroes.map((hero) => setState(() => _heroes.add(hero)));
     print(_heroes);
  }
}