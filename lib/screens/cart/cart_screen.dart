import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/models/cm_cart.dart';
import 'package:shopy/screens/home/home_screen.dart';
import 'package:shopy/screens/sign_in/payment_sign_in.dart';
import 'package:shopy/size_config.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckOurCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const SizedBox(
            width: 250,
            child: Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Consumer<Cart>(builder: (build, cart, child) {
            return SizedBox(
              width: 250,
              child: Text(
                "  ${cart.size()}  items",
                style: const TextStyle(color: Colors.black),
              ),
            );
          })
        ],
      ),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, HomeScreen.routeName),
                  child: const Text(
                    " Continue your purchases",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),

                // Here width is fixed that's why use const
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios,
                    size: 12, color: kTextColor),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Consumer<Cart>(builder: (builder, cart, child) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text:
                                cart.getTotalPrice().toStringAsFixed(2) + " Dt",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: ElevatedButton(
                        onPressed: (cart.getTotalPrice() > 0)
                            ? () {
                                Navigator.popAndPushNamed(
                                    context, PaymentSignIn.routeName);
                                // LoginState.instance.login()
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.deepOrangeAccent, // Background color
                        ),
                        child: const Text(
                          'Check Out',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ]);
            })
          ],
        ),
      ),
    );
  }
}
