import 'package:flutter/material.dart';

class HeroTextDetail extends StatelessWidget {
  final int baseAttr;
  final String description;
  final Color color;
  const HeroTextDetail({Key key, this.baseAttr, this.description, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(description, style: TextStyle(fontSize: 25, color: color)),
          Text(baseAttr.toString(),
              style: TextStyle(fontSize: 25, color: color)),
        ],
      ),
    );
  }
}
