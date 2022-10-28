// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w), color: Colors.white),
      child: Padding(
        padding: UI_Helper.getIconPadding(),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildInformationRow('Name', pokemon.name),
          _buildInformationRow('Height', pokemon.height),
          _buildInformationRow('Weight', pokemon.weight),
          _buildInformationRow('Spawn Time', pokemon.spawnTime),
          _buildInformationRow('Weakness', pokemon.weaknesses),
          _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
          _buildInformationRow('Next Evolution', pokemon.nextEvolution),
        ]),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokemonInformationNameStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getPokemonInformationValueStyle(),
          )
        else if (value == null)
          Text(
            'Not Available',
            style: Constants.getPokemonInformationValueStyle(),
          )
        else
          Text(value, style: Constants.getPokemonInformationValueStyle()),
      ],
    );
  }
}
