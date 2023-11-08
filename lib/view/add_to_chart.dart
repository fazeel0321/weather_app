import 'package:flutter/material.dart';

class AddChartScreen extends StatefulWidget {
  final selectedProduct;

  AddChartScreen({this.selectedProduct});

  @override
  _AddChartScreenState createState() => _AddChartScreenState();
}

class _AddChartScreenState extends State<AddChartScreen> {
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.selectedProduct);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Products:'),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cartItems[index]['title']),
                    subtitle: Text(_cartItems[index]['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_cartItems[index]['price'].toString()),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
