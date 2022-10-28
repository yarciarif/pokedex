// ignore_for_file: must_be_immutable, sort_child_properties_last
 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/widgets/poke_information.dart';
import 'package:flutter_pokedex/widgets/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  PokemonModel pokemon;
  DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody(context);
  }

  Scaffold _buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UI_Helper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                iconSize: 16.w,
                padding: UI_Helper.getIconPadding(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.2.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: UI_Helper.getDefaultPadding(),
                          child: PokeInformation(pokemon: pokemon))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UI_Helper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              iconSize: 24.w,
              padding: UI_Helper.getIconPadding(),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          PokeTypeName(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  Constants.pokeBallImageUrl1,
                  height: 0.13.sh,
                  fit: BoxFit.fitHeight,
                ),
                top: 0,
                right: 0,
              ),
              Positioned(
                child: PokeInformation(pokemon: pokemon),
                top: 0.12.sh,
                bottom: 0,
                left: 0,
                right: 0,
              ),
              Align(
                alignment: Alignment.topCenter,

                //RESİMLERİN ALTTAN ANİMASYONLU BİR ŞEKİLDE GELMESİ İÇİN HERO WİDGETI İLE SARMALIYORUZ.
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
