import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/controller/provider/preferences/preference.dart';
import '../../model/products_model.dart';
import '../api_managment.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductsModel>? data;
  List<ProductsModel> favProducts = [];
  bool isLoading = false;

  void getItems() async {
    var productData = await ApiManager.getitem();
    if (productData != null) {
      data = productData;
      notifyListeners();
    }
  }

  void toggleFavorite(ProductsModel product) {
    if (isProductFavorite(product)) {
      removeFavorite(product);
    } else {
      saveFavorite(product);
    }
    notifyListeners();
  }

  void saveFavorite(ProductsModel product) {
    if (!isProductFavorite(product)) {
      favProducts.add(product);

      PreferenceManager.addFavorite(product);
    }
    notifyListeners();
  }

  void removeFavorite(ProductsModel product) {
    if (isProductFavorite(product)) {
      favProducts.remove(product);

      PreferenceManager.removeFavorite(product);
    }
    notifyListeners();
  }

  bool isProductFavorite(ProductsModel product) {
    return favProducts.contains(product);
  }

  Future<void> getFavoritesFromPreferences() async {
    List<String> favoriteStrings = await PreferenceManager.getFavourites();
    favProducts = favoriteStrings
        .map((e) => ProductsModel.fromJson(jsonDecode(e)))
        .toList();
    notifyListeners();
  }
}
