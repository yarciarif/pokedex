// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokedexListFuture;

  @override
  void initState() {
    _pokedexListFuture = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Pokemon List Builder çalıştı');
    return FutureBuilder<List<PokemonModel>>(
      future: _pokedexListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _Listem = snapshot.data!;

          return GridView.builder(
              itemCount: _Listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 4),
              itemBuilder: ((context, index) {
                debugPrint('Item Builder çalıştı');
                return PokeListItem(pokemon: _Listem[index]);
              }));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata çıktı'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
