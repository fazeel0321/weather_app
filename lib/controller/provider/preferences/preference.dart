import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/products_model.dart';

class PreferenceManager {
  static const String key = "favorites";

  static Future<List<String>> getFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList(key);
    return favorites ?? [];
  }

  static Future<void> addFavorite(ProductsModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavourites();
    favorites.add(jsonEncode(product.toJson()));
    await prefs.setStringList(key, favorites);
  }

  static Future<void> removeFavorite(ProductsModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavourites();
    favorites.remove(jsonEncode(product.toJson()));
    await prefs.setStringList(key, favorites);
  }
}
