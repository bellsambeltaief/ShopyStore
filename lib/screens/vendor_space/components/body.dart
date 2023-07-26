import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopy/helper/invoker.dart';
import 'package:shopy/screens/vendor_space/components/edit_product.dart';
import '../../../components/delete_dialog.dart';
import '../../../models/cm_product.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductList list = Provider.of<ProductList>(context, listen: false);
    return Consumer<VendorProduct>(
      builder: (context, products, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: products.products.length,
            itemBuilder: (context, index){
              Product product = list.getProductById(products.products[index])!;
            return Material(
              elevation: 2,
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: "Delete",
                      onPressed: (context){
                        deleteDialog(widget.scaffoldKey.currentContext!, (){
                          Navigator.of(widget.scaffoldKey.currentContext!).pop();
                          Invoker.delete('/api/v1/product/${product.id_}/delete', true).then((value){
                            setState(() {
                              products.remove(product.id_);
                              list.removeProduct(product);
                            });
                          });
                        });
                    }),
                    SlidableAction(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: "Edit",
                      onPressed: (context){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return EditProductScreen(product: product,);
                        })).then((value){
                          setState(() {

                          });
                        });
                    })

                  ],
                ),
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: ListTile(
                      // horizontalTitleGap: 20,
                      leading: Image.network(product.images[0], width: 82, height: 82,),
                      title: Text(product.title),
                      trailing: Text('${product.price.toStringAsFixed(2)} dt', style: const TextStyle(color: Colors.deepOrange),),
                      dense: false,
                    ),
                  ),
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10,);
          },),
        );
      }
    );
  }
}
