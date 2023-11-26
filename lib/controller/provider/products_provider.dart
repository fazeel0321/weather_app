import 'package:flutter/material.dart';
import 'package:weather_app/controller/provider/preferences/preference.dart';

import '../../model/products_model.dart';
import '../api_managment.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductsModel>? data;
  List<ProductsModel> favProducts = [];
  bool isLoading = false;

  // get favProducts => null;

  // get productdata => null;

  saveFavourite(product) {
    PreferenceManager.addFavorite(product);
    notifyListeners();
  }

  removeFavorite(ProductsModel product) {
    favProducts.remove(product);
    notifyListeners();
  }

  getitem() async {
    var productData = await ApiManager.getitem();
    if (productData != null) {
      data = productData;
      notifyListeners();
    }
  }

  // void toggleFavorite(ProductsModel product) {
  //   if (isProductFavorite(product)) {
  //     removeFavorite(product);
  //   } else {
  //     saveFavourite(product);
  //   }
  // }

  isProductFavorite(ProductsModel product) {
    return favProducts.contains(product);
  }

  toggleFavorite(ProductsModel product) {
    if (isProductFavorite(product)) {
      removeFavorite(product);
    } else {
      saveFavourite(product);
    }
    notifyListeners();
  }
}
