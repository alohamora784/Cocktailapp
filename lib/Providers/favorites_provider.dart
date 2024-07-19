import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<String> _favorites = [];
  List<String> get favorites => _favorites;

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList("favorite") ?? [];
    notifyListeners();
  }

  Future<void> saveFavorites(int? id, ) async {
    final prefs = await SharedPreferences.getInstance();
    var i = id.toString();
    _favorites.add(i);
    await prefs.setStringList('favorite', _favorites);
    notifyListeners();
  }
}
