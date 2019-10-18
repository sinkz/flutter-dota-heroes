import 'dart:ffi';

class DotaHero {
  final int id;
  final String name;
  final String attr;
  final String atackType;
  final String imageURL;
  final String icon;
  final int baseAgi;
  final int baseInt;
  final int baseStr;
  final int moveSpeed;

  DotaHero({this.id, this.name, this.attr, this.atackType, this.imageURL, this.icon, this.baseAgi, this.baseInt, this.baseStr, this.moveSpeed});

  factory DotaHero.fromJson(Map<String, dynamic> json) {
    return DotaHero(
      id: json['id'],
      name: json['localized_name'],
      attr: json['primary_attr'],
      atackType: json['attack_type'],
      imageURL: json['img'],
      icon: json['icon'],
      baseAgi:  json['base_agi'],
      baseInt:  json['base_int'],
      baseStr:  json['base_str'],
      moveSpeed: json['move_speed'],
    );
  }
}