import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopy/components/rate_dialog.dart';
import 'package:shopy/screens/details/components/body.dart';
import '../constants.dart';
import '../helper/invoker.dart';
import '../models/cm_favorite.dart';
import '../models/cm_product.dart';
import '../models/cm_user.dart';
import '../size_config.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double? rate ;
  bool canRate = true;
  getRate(){
    CmUser user = Provider.of<CmUser>(context, listen: false);
    Invoker.get('/api/v1/product/create-product-rating/', false, query: {'product_id': widget.product.id.toString()}).then((value){
      value = (value["queryset"] as List<dynamic>);
      if (value.length >= 1) {
        double sum = (value as List<dynamic>).map((e){
        if(user.getEmail == "" || e["user"] == user.getEmail){
          canRate = false;
        }
        return (double.tryParse(e["rating"].split(" ")[0])?? 0);
      }).toList().reduce((value, element) => value + element);
        if(mounted){
          setState(() {
            rate = sum / value.length;

          });
        }
      }else{
        setState(() {
          rate = 5;
        });
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    if(rate == null){
      getRate();
    }
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
          (rate != null)?TextButton(

            onPressed: () {
              CmUser user = Provider.of<CmUser>(context, listen: false);
              if (user.getEmail == ""){
                final snackBar = SnackBar(
                  content: const Text('please login to Rate our products!'),
                  action: SnackBarAction(

                    label: 'Undo',
                    textColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);                      }
              else if(!canRate){
                final snackBar = SnackBar(
                  content: const Text('you already rated this product!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    textColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else{
                rateDialog(context, widget.product.id_, onPress: setState, args: ()=> rate = null).then(
                        (value){
                      setState((){
                        rate = null;
                      });
                    }
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Text("$rate", style: const TextStyle(color: Colors.deepOrangeAccent)),
                  const Icon(Icons.star, color: Colors.deepOrangeAccent,)
                ],
              ),
            ),
          ):const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          )
          // TextButton(child: const Text("4.7", style: TextStyle(color: Colors.deepOrangeAccent),), onPressed: (){})
        ],
      ),
      body: DetailBody(product: widget.product),
    );
  }
}


class ProductCard extends StatefulWidget {
    const ProductCard({
    Key ? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product, 
    required this.press,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final GestureTapCallback press;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {



  void _gotoDetailPage(BuildContext context){

    Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) {
              return ProductDetailsScreen(product: widget.product,);
            }))).then((value) => setState(() {
              
            },));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: ()=> _gotoDetailPage(context),

        child: 
        
        SizedBox(
          width: getProportionateScreenWidth(widget.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(tag: "product${widget.product.title}", child:Image.network(widget.product.images[0])),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.title,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product.price} Dt",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
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
                      Favorite list = Provider.of<Favorite>(context, listen: false);
                       setState(() {
                          widget.product.isFavouritesValue = !widget.product.isFavourites;
                          if(widget.product.isFavourites){
                            list.addProduct(widget.product.id);
                          }else{
                            list.deleteProduct(widget.product.id);
                          }
                        });
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.product.isFavourites
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: widget.product.isFavourites
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
