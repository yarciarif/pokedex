// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart'; 
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var PokeList = jsonDecode(result.data)['pokemon'];
    //debugPrint(result.toString());
    //debugPrint(PokeList.toString());
    if (PokeList is List) {
      _list = PokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }

    //debugPrint(_list.toString());
    return _list;
  }
}
