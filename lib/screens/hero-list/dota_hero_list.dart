import 'package:flutter/material.dart';
import '../../services/dota_hero_service.dart';
import '../../model/dota_hero.dart';
import '../../widgets/dota_hero_item.dart';

class DotaHeroList extends StatefulWidget {
  @override
  _DotaHeroListState createState() => _DotaHeroListState();
}

class _DotaHeroListState extends State<DotaHeroList> {
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
  Widget build(BuildContext context) => Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemExtent: 100.0,
                itemCount: _heroes.length,
                itemBuilder: (context, index) => DotaHeroItem(_heroes[index]),
              ),
      );

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
