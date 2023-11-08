import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/store_model.dart';
import 'package:weather_app/view/productscreen.dart';

import 'add_to_chart.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  var storedata;
  List<String> cartItems = [];
  List<String> favItems = [];
  Temperatures? data;
  getstoredata() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var data = await http.get(url);
    var finaldata = jsonDecode(data.body);
    setState(() {
      storedata = finaldata;
    });
  }

  @override
  void initState() {
    super.initState();
    getstoredata();
    getCartItems();
    getFavItems();
  }

  getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems = prefs.getStringList('cartItems') ?? [];
    });
  }

  addToCart(productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems.add(productId);
      prefs.setStringList('cartItems', cartItems);
    });
  }

  isProductInCart(productId) {
    return cartItems.contains(productId);
  }

  getFavItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favItems = prefs.getStringList('favItems') ?? [];
    });
  }

  addToFav(productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favItems.add(productId);
      prefs.setStringList('favItems', favItems);
    });
  }

  bool isProductInFav(String productId) {
    return favItems.contains(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                List<Map<String, dynamic>> selectedProducts = [];
                for (var i = 0; i < storedata.length; i++) {
                  if (isProductInCart(storedata[i]['id'].toString())) {
                    selectedProducts.add(storedata[i]);
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => AddChartScreen(
                              selectedProduct: selectedProducts,
                            ))));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: storedata == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: storedata.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ProductDetailScreen(
                              productData: storedata[index],
                            )),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(storedata[index]["image"]),
                          ListTile(
                            title: Text(storedata[index]['title']),
                            subtitle: Text(storedata[index]['description']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isProductInFav(
                                        storedata[index]['id'].toString())
                                    ? IconButton(
                                        icon: Icon(Icons.favorite,
                                            color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            favItems.remove(storedata[index]
                                                    ['id']
                                                .toString());
                                            SharedPreferences.getInstance()
                                                .then((prefs) {
                                              prefs.setStringList(
                                                  'favItems', favItems);
                                            });
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        onPressed: () {
                                          addToFav(storedata[index]['id']
                                              .toString());
                                        },
                                      ),
                                isProductInCart(
                                        storedata[index]['id'].toString())
                                    ? Icon(Icons.check, color: Colors.green)
                                    : ElevatedButton(
                                        onPressed: () {
                                          addToCart(storedata[index]['id']
                                              .toString());
                                        },
                                        child: Text('Add to Cart'),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
