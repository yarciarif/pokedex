import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/pages/detail_page.dart';
import 'package:flutter_pokedex/widgets/poke_image_and_ball.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItem extends StatelessWidget {
  //POKEMON MODEL TURUNDE BIR POKEMON NESNESI OLUSTURUP BUNU PARAMETRE OLARAK POKELISTITEM SINIFINA ATIYORUZ.
  final PokemonModel pokemon;
  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      }),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UI_Helper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UI_Helper.getDefaultPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameStyle(),
                ),
                Chip(
                    label: Text(
                  pokemon.type![0],
                  style: Constants.getPokemonTypeStyle(),
                )),
                Expanded(child: PokeImgAndBall(pokemon: pokemon)),
              ]),
        ),
      ),
    );
  }
}
