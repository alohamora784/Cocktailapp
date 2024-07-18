import 'package:dio/dio.dart';
import 'package:cocktailapp/Models/cocktails.dart';
import 'package:flutter/material.dart';

class CocktailProvider with ChangeNotifier {
  List<Cocktail> _cocktails = [];
  List<Cocktail> get cocktails => _cocktails;

  Future<void> fetchdata() async {
    final dio = Dio();
    final response = await dio
        .get(("https://www.thecocktaildb.com/api/json/v1/1/search.php?s"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data["drinks"];
      _cocktails = responseData.map((json) => Cocktail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts ');
    }
    notifyListeners();
  }
}
