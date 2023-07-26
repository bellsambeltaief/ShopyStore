import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_cart.dart';
import 'package:shopy/models/cm_favorite.dart';
import 'package:shopy/size_config.dart';
import 'package:collection/collection.dart';
import '../../../constants.dart';
import '../../../models/cm_product.dart';
import '../../../models/cm_user.dart';


class DetailBody extends StatefulWidget {
    final Product product ;

  const DetailBody({Key? key,
    required this.product}) : super(key: key);

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  int imageIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Expanded(
         flex: (height < 500)?2:1,
         child: Container(
         // height: height * .4,
         color: const Color.fromARGB(66, 210, 207, 207),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

                   Center(
                    child: Hero(
                     child:Image.network(widget.product.images[imageIndex], height: height *0.25, width: 220,),
                    tag: "product${widget.product.title}"
                    ),
                   ),

                Padding(padding: const EdgeInsets.all( 5), child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.product.images.mapIndexed((index, image)=> GestureDetector(
                    child: Container(

                      decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color: Colors.deepOrangeAccent, width: (imageIndex == index)?1.25:0)),
                    child: Image.network(image, height: 75, width: 75,)),
                    onTap: (){
                      setState(() {
                        imageIndex = index;
                      });
                    },
                  )).toList()
                  ,
                ),
                ),

              ],
         ),

     ),
       ),
    //  SizedBox(height: height*0.1,),
     Expanded(
       flex: 1,
       child: SizedBox(
         height: height*.45,
         child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
         children: [
              Padding(padding: const EdgeInsets.only(left: 10, bottom: 10), child: Text(widget.product.title,
                    style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: Colors.black),
                    ),

                    ),

          Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  const Text('Price: '),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("${widget.product.price} Dinars", style: const TextStyle(color: Colors.deepOrange),),
                  ),
                ],
              ),
            ),

            GestureDetector(child:
            Container(

                        //padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        // height: getProportionateScreenWidth(50),
                        // width: getProportionateScreenWidth(75),
                        height: 50,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                          color: widget.product.isFavourites
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                        ),
                        child: Padding(padding: const EdgeInsets.all(17), child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          height: getProportionateScreenWidth(5),
                          width: getProportionateScreenWidth(5),
                          color: widget.product.isFavourites
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                        ),

                        ),


                      ),
            onTap: (){
              CmUser user = Provider.of<CmUser>(context, listen: false);
              if(user.getEmail == "") {
                final snackBar = SnackBar(
                  content: const Text('you need to be logged in!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    textColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBar);
                return;
              }
              setState(() {
                Favorite list = Provider.of<Favorite>(context, listen: false);

                widget.product.isFavouritesValue = !widget.product.isFavourites;
                if(widget.product.isFavourites){
                  list.addProduct(widget.product.id);
                }else{
                  list.deleteProduct(widget.product.id);
                }
              });
            },)
                      ],

        ),
                     Padding(padding: const EdgeInsets.only(right: 10, left: 15, top: 5), child:
                    //  Text("See More Detail",
                    //  style: TextStyle(fontWeight: FontWeight.normal, fontSize:16,
                    //  decoration: TextDecoration.underline , color: Colors.deepOrangeAccent) ,

                    // )
                       SeeMore(text: widget.product.description),


                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const Text("Quantity"),
                            StatefulBuilder(builder: (BuildContext build, StateSetter setState){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){
                                    if(quantity > 1){
                                      setState((){
                                        quantity = quantity - 1;

                                      });
                                    }}
                                    , child: const Icon(Icons.remove, color: Colors.deepOrange,),),
                                  Container(child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                    child: Text("$quantity", style: const TextStyle(color: Colors.white, fontSize: 16),),
                                  ), decoration: const BoxDecoration(color: Colors.deepOrange),),
                                  TextButton(onPressed: (){setState((){quantity = quantity + 1;});}, child: const Icon(Icons.add, color: Colors.deepOrange,)),


                                ],
                              );
                                }),
                          ],
                        ),
                      ),
                    ),

                       Center(
                         child: ElevatedButton(

                          onPressed: () {
                            Cart cart = Provider.of<Cart>(context, listen:false);
                            // demoCarts.add(Cart(c: widget.product, numOfItems: 1));
                            cart.add(CartItem(id: widget.product.id_, quantity: quantity));
                            // Navigator.pushNamed(context, CartScreen.routeName);
                           final snackBar = SnackBar(
                                    content: const Text('The product has been added to your cart!'),
                                    action: SnackBarAction(

                              label: 'Undo',
                              textColor: Colors.deepOrangeAccent,
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
                          child: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.deepOrangeAccent,
                      // Background color
                    ),
                        ),
                                       ),


         ],
       ),
       ),
       ),
     ),
    ],);
     
  }
}
class SeeMore extends StatefulWidget {
  final String text;
  const SeeMore({ Key? key, required this.text }) : super(key: key);

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "show more" : "show less",
                        style: const TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
    
  }
}
