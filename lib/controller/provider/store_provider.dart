import 'package:flutter/material.dart';

import '../../model/store_model.dart';
import '../api_managment.dart';

class StoreProvider extends ChangeNotifier {
  Temperatures? temdata;

  gettem() async {
    temdata = await ApiManager.getstoredata();
    notifyListeners();
  }

  isProductInCart(id) {}
}
