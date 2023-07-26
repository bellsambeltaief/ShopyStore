// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shopy/screens/splash/components/body.dart';
import 'package:shopy/size_config.dart';
import '../../helper/invoker.dart';
import '../../models/cm_product.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Invoker.get('api/v1/product/view-product/', false).then((value) {
      print(value);
      print("here");
      ProductList.getInstance().products = (value as List<dynamic>)
          .map((e) => Product(
              id_: e["id"],
              images: [e["image"]],
              title: e["prod_name"],
              price: e["price"],
              description: e["description"]))
          .toList();
    });
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
