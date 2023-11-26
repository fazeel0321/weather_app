import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/new_model.dart';
import '../../../model/products_model.dart';

class PreferenceManager {
  static String key = "products";

  static getFavourites() async {
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString(key);
    if (data != null) {
      return jsonDecode(data);
    } else {
      return [];
    }
  }

  // static addFavorites(StoreModel product) async {
  //   var pref = await SharedPreferences.getInstance();
  //   List data = await getFavourites();
  //   data.add(product);
  //   pref.setString(key, jsonEncode(data));
  // }

  // static removeFavorite(ProductsModel product) async {
  //   var pref = await SharedPreferences.getInstance();
  //   List data = await getFavourites();
  //   data.remove(product.toJson());
  //   pref.setString(key, jsonEncode(data));
  // }
  static addFavorite(ProductsModel product) async {
    var pref = await SharedPreferences.getInstance();
    List data = await getFavourites();
    data.add(product.toJson());
    pref.setString(key, jsonEncode(data));
  }

  static removeFavorite(ProductsModel product) async {
    var pref = await SharedPreferences.getInstance();
    List data = await getFavourites();
    data.remove(product.toJson());
    pref.setString(key, jsonEncode(data));
  }

  void toggleFavorite(ProductsModel product) async {
    var isFavorite = await PreferenceManager.isFavorite(product);

    if (isFavorite) {
      await PreferenceManager.removeFavorite(product);
    } else {
      await PreferenceManager.addFavorite(product);
    }
  }

  static isFavorite(ProductsModel product) async {
    var pref = await SharedPreferences.getInstance();
    List<String> favorites = pref.getStringList(key) ?? [];

    return favorites.contains(product.id.toString());
  }
}
