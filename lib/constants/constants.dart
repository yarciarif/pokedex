import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static String title = 'Pokedex';
  static String pokeBallImageUrl1 = 'images/pokeball.png';

  static TextStyle getTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48),
        color: Colors.white);
  }

  static TextStyle getPokemonNameStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20),
        color: Colors.white);
  }

  static TextStyle getPokemonDetailNameStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(32),
        color: Colors.white);
  }

  static TextStyle getPokemonTypeStyle() {
    return TextStyle(
      fontSize: _calculateFontSize(20),
      color: Colors.white,
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.5).sp;
    }
  }

  static TextStyle getPokemonInformationNameStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20),
        color: Colors.black);
  }

  static TextStyle getPokemonInformationValueStyle() {
    return TextStyle(fontSize: _calculateFontSize(14), color: Colors.black);
  }
}
