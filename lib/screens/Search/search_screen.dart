import 'package:flutter/material.dart';

import '../../components/product_card.dart';
import '../../models/cm_product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(this.products, {Key? key}) : super(key: key);
  final List<dynamic> products;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        var product = widget.products[index];
       return ProductCard(
         product: Product(description: product["description"], title: product["prod_name"], images: [product["image"]], id_: product["id"], price: product["price"]), press: () {

       },);
      }, itemCount: widget.products.length,)
    );
  }
}
