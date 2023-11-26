// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_app/controller/provider/store_provider.dart';
// import 'add_to_chart.dart';
// import 'productscreen.dart';

// class MyBagScreen extends StatefulWidget {
//   const MyBagScreen({super.key});

//   @override
//   State<MyBagScreen> createState() => _MyBagScreenState();
// }

// class _MyBagScreenState extends State<MyBagScreen> {
//   @override
//   void initState() {
//     var provider = context.read<StoreProvider>();
//     provider.getdata();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           // IconButton(
//           //   onPressed: () {
//           //     List<Map<String, dynamic>> selectedProducts = [];

//           //     final provider = context.read<StoreProvider>();

//           //     for (var i = 0; i < provider.temdata!.length; i++) {
//           //       if (provider.isProductInCart(provider.temdata!.i.id)) {
//           //         selectedProducts.add(provider.temdata!.i);
//           //       }
//           //     }

//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: ((context) => AddChartScreen(
//           //               selectedProduct: selectedProducts,
//           //             )),
//           //       ),
//           //     );
//           //   },
//           //   icon: Icon(Icons.add),
//           // )
//         ],
//       ),
//       body: Consumer<StoreProvider>(
//         builder: (context, provider, child) {
//           if (provider.temdata == null) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return ListView.builder(
//               itemCount: provider.temdata!.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: ((context) => ProductDetailScreen(
//                               productData: provider.temdata!.index,
//                             )),
//                       ),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 10),
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.all(8),
//                       child: Column(
//                         children: [
//                           Image.network(provider.temdata!.image),
//                           ListTile(
//                             title: Text(provider.temdata!.title),
//                             subtitle: Text(provider.temdata!.description),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
