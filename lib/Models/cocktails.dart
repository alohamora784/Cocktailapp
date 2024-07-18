import 'package:flutter/material.dart';

class Cocktail {
  final int? idDrink;
  final String strDrink;
  final String strCategory;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strDrinkThumb;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;

  factory Cocktail.fromJson(json) {
    return Cocktail(
      idDrink: int.tryParse(json["idDrink"]),
      strDrink: json["strDrink"],
      strCategory: json["strCategory"],
      strAlcoholic: json["strAlcoholic"],
      strGlass: json["strGlass"],
      strInstructions: json["strInstructions"],
      strDrinkThumb: json["strDrinkThumb"],
      strIngredient1: json["strIngredient1"],
      strIngredient2: json["strIngredient2"],
      strIngredient3: json["strIngredient3"],
      strIngredient4: json["strIngredient4"],
      strIngredient5: json["strIngredient5"],
    );
  }

  Cocktail({
    required this.idDrink,
    required this.strDrink,
    required this.strCategory,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions,
    required this.strDrinkThumb,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
  });
}
