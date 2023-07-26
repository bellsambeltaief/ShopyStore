// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';
import 'package:shopy/helper/invoker.dart';
import '../../../models/cm_product.dart';
import '../../../models/cm_user.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new Product",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        elevation: 2,
      ),
      body: const BodyForm(),
    );
  }
}

class BodyForm extends StatefulWidget {
  const BodyForm({Key? key}) : super(key: key);

  @override
  _BodyFormState createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyForm> {
  Uint8List? imageBytes;
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;
  String imageName = "";

  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productNameController.dispose();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      final ImagePicker _picker = ImagePicker();
                      _picker
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        value?.readAsBytes().then((imgBytes) {
                          setState(() {
                            imageBytes = imgBytes;
                            imageName = value.name;
                          });
                        });
                      });
                    },
                    child: (imageBytes == null)
                        ? DottedBorder(
                            strokeWidth: 2,
                            dashPattern: const [6, 6],
                            child: const SizedBox(
                              height: 150,
                              width: 150,
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ))
                        : SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.memory(
                              imageBytes!,
                              height: 150,
                              width: 150,
                            ),
                          ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productNameController,
                decoration: const InputDecoration(
                    label: Text("Product Name"),
                    labelStyle: TextStyle(color: Colors.orangeAccent),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productPriceController,
                decoration: const InputDecoration(
                    label: Text("Product Price"),
                    labelStyle: TextStyle(color: Colors.orangeAccent),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54))),
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: productDescriptionController,
                    keyboardType: TextInputType.multiline,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                        label: Text("Product Description"),
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CmUser user = Provider.of<CmUser>(context, listen: false);
                Invoker.multipartPost('api/v1/product/create-product/', true, {
                  'prod_name': productNameController.text,
                  'price': productPriceController.text,
                  'description': productDescriptionController.text,
                  'vender': user.id.toString()
                }, {
                  'body': imageBytes,
                  'name': imageName,
                  'mediaType':
                      lookupMimeType('', headerBytes: imageBytes)?.split('/')[1]
                }).then((value) {
                  var body = json.decode(value.body);
                  print(body);
                  VendorProduct products =
                      Provider.of<VendorProduct>(context, listen: false);
                  ProductList.getInstance().addProduct(Product(
                      id_: body["id"],
                      images: [body["image"]],
                      title: body["prod_name"],
                      price: body["price"],
                      description: body["description"]));
                  products.addProduct(body["id"]);
                  Navigator.of(context).pop();
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text("Add"),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent),
            )
          ],
        ),
      ),
    );
  }
}
