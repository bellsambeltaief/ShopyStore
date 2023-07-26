import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/screens/home/components/popular_products.dart';
import 'package:shopy/screens/home/components/special_offers.dart';
import 'package:shopy/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const DiscountBanner(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const Categories(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const SpecialOffers(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            Consumer<ProductList>(builder: (_, list, child) {
              return const PopularProducts();
            }),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
          ],
        ),
      ),
    );
  }
}
