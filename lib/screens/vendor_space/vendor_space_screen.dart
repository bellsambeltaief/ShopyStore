import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/vendor_space/components/add_product.dart';
import '../../models/cm_product.dart';
import 'components/body.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          key: _scaffoldKey,
         appBar: AppBar(title: const Text(" \t \t \t \t \t  My Products", style: TextStyle(fontWeight: FontWeight.bold)), foregroundColor: Colors.black, elevation: 2,),
          body: Consumer<ProductList>(builder: (_, list, child){
            return Body(scaffoldKey: _scaffoldKey,);
          },),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return const AddProductScreen();
            })).then((value) => setState((){}));
          }, child: const Icon(Icons.add), backgroundColor: Colors.deepOrange,),
        );
      }
}

