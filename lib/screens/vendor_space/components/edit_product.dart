import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shopy/helper/invoker.dart';
import '../../../models/cm_product.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key, required  this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product", style: TextStyle(color: Colors.deepOrangeAccent),),),
      body: Body(product: product,),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Uint8List? imageBytes;
  late TextEditingController productNameController ;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;

  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController(text: widget.product.title);
    productPriceController = TextEditingController(text: widget.product.price.toString());
    productDescriptionController = TextEditingController(text: widget.product.description);
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: productNameController,
                  decoration: const InputDecoration(label: Text("Product Name"),
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)
                  )
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: productPriceController,
                decoration: const InputDecoration(label: Text("Product Price"),
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)
                  )
              ),),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: productDescriptionController,
                    keyboardType: TextInputType.multiline,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(label: Text("Product Description"),
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrangeAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)
                        )

                    )),
              ),
            ),
            ElevatedButton(onPressed: (){
                Invoker.put('/api/v1/product//update-product/${widget.product.id}', true,
                {
                  'prod_name': productNameController.text,
                  'price': double.tryParse(productPriceController.text) ?? 0,
                  'description': productDescriptionController.text
                }).then((value){
                  widget.product.setTitle = productNameController.text;
                  widget.product.setPrice = double.tryParse(productPriceController.text) ?? 0;
                  widget.product.setDescription = productDescriptionController.text;
                  Navigator.of(context).pop();
                });
            }, child: const Padding(
              padding: EdgeInsets.all(9.0),
              child: Text("Save"),
            ), style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent
            ),)
          ],
        ),
      ),
    );
  }
}
