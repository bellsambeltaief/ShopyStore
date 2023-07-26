import 'package:flutter/material.dart';
import '../../../models/cm_product.dart';
import '../../../size_config.dart';
import '../../details/components/body.dart';



class FavoriteItemCard extends StatefulWidget {
  const FavoriteItemCard({
    Key? key, 
    required this.product,
  }) : super(key: key);
    final Product product;

  @override
  State<FavoriteItemCard> createState() => _FavoriteItemCardState();
}

class _FavoriteItemCardState extends State<FavoriteItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _gotoDetailPage(context);
      },
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: const Color(0xFFF5F6F9),
              borderRadius:  BorderRadius.circular(15),
              ),
              child: Image.network(widget.product.images[0]),
            ),
            ) ,
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(widget.product.title,
               style: const TextStyle(
                 fontSize: 16,
                 color: Colors.black),
                 maxLines: 2,

               ),
               const SizedBox(height: 10),
              //  Text.rich(
              //    TextSpan(text: "\$${cart.product.price}",
              //    style: TextStyle(

              //      color: kPrimaryColor),
              //      children: [TextSpan(
              //        text:" x${cart.numOfItems}",
              //        style: TextStyle(color: kTextColor),

              //      ),
              //      ],
              //    ),
              //  ),

               ],
            ),
        ],

      ),
    );
  }

  void _gotoDetailPage(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(66, 210, 207, 207),
              title: const Center(child: Text("Details" ,
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,)
                ,)),
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_ios_new_sharp),
                onTap: () => Navigator.pop(context),

              ),
              actions: [
                TextButton(child: const Text("4.7", style: TextStyle(color: Colors.deepOrangeAccent),), onPressed: (){})
              ],
            ),
            body: DetailBody(product: widget.product),
          );
        }))).then((value){});
  }
}