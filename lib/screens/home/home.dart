import 'package:dota_app/screens/hero-list/dota_hero_list.dart';
import 'package:dota_app/screens/hero-list/dota_hero_snap.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dota Heroes'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'List of Heroes'),
              Tab(text: 'Snap of Heroes'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[DotaHeroList(), 
          DotaHeroSnap()
          ],
        ),
      ),
      length: 2,
    );
  }
}
