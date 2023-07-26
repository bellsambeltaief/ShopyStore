import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/cart/cart_screen.dart';
import 'package:shopy/screens/home/components/search_field.dart';
import 'package:shopy/size_config.dart';
import '../../../models/cm_cart.dart';
import 'icon_btn_with_counter.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          Consumer<Cart>(builder: (builder, cart, child){
            return IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              numOfItems: cart.size(),
              press: () => Navigator.pushNamed(context, CartScreen.routeName),

            );
          }),
       
        ],
      ),
    );
  }
}

