import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/dota_hero.dart';

Future<List<DotaHero>> getDotaHeroes() async {
  final response = await http.get('https://api.opendota.com/api/heroStats');

  if (response.statusCode == 200) {
    Iterable heroes = convert.jsonDecode(response.body);
    return heroes.map((model) => DotaHero.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load heroes');
  }
}
