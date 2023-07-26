import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_favorite.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/screens/favoris/components/favorite_card.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal:getProportionateScreenWidth(28),

           ),
        child: Consumer<Favorite>(
          builder: (context, list, child) {
            return SingleChildScrollView(
              child: Column(
                children: [

                   SizedBox(
                    height: SizeConfig.screenHeight * 0.07,),

                  const Text("",
                  textAlign: TextAlign.center,
                  ),




                 SizedBox(height:  getProportionateScreenHeight(20),),

                  ...list.favorite.map((e){
                    Product product = ProductList.getInstance().products.where((element) => element.id == e).first;
                    return FavoriteItemCard(product: product);
                  }).toList()

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
