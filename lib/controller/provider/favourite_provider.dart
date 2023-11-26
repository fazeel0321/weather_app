import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/controller/provider/preferences/preference.dart';

import '../../model/products_model.dart';

class FavouriteProvider extends ChangeNotifier {
  List<ProductsModel> favProducts = [];
  bool isLoading = false;

  getFavourites() async {
    favProducts!.clear();
    isLoading = true;
    notifyListeners();
    var data = await PreferenceManager.getFavourites();
    for (var element in data) {
      var product = ProductsModel.fromJson(element);
      favProducts!.add(product);
    }
    print(favProducts);

    isLoading = false;
    notifyListeners();
  }
}
