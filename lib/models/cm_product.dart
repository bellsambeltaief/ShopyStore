
import 'package:flutter/material.dart';

class Product {
  String title, description;
  final List<String> images;
  final List<Color>? colors;
  final double rating;
  double price;
  final int? vendorId;
  bool isFavourites, isPopular;
  final int id_;

  Product({
    this.vendorId,
    required this.id_,
    required this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourites=false,
    this.isPopular=false,
    required this.title,
    required this.price,
    required this.description,


  });

  get id => id_;
  set isFavouritesValue(bool a){
    isFavourites = a;
  }

  set setPrice(double prix){
    price = prix;
  }

  set setTitle(String name){
    title = name;
  }

  set setDescription(String desc){
    description = desc;
  }

}

List<Product> demoProducts = [
  Product(
    id_: 4,
    images:[
      // "assets/images/ps4_console_white_1.png",
      // "assets/images/ps4_console_white_2.png",
      // "assets/images/ps4_console_white_3.png",
      // "assets/images/ps4_console_white_4.png",
     
    ], 
    colors: [
      // const Color(0xFFF6625E),
      // const Color(0xFF836DBB),
      // const Color(0xFFDECB9C),
      // Colors.white,
    ],
     title: "Wireless Controller for PS4", 
     price: 64.00 , 
     description: "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play...", 
     rating: 4.8,
     isFavourites: false
     ,
     isPopular: true,
     ),
     Product(
       id_: 3,
     images: [
       "assets/images/Image Popular Product 2.png"
       ], 
     colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DBB),
      const Color(0xFFDECB9C),
      Colors.white,
      
     ],
      title: "Nike Sport White - Man Pant",
       price: 50.5,
       description: "description",
       rating: 4.1,
       isPopular: true,

       ),
       Product(
         id_: 1,
     images: [
       "assets/images/glap.png"
       ], 
     colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DBB),
      const Color(0xFFDECB9C),
      Colors.white,
      
     ],
     
      title: "Gloves XC Omega - Polygon",
       price: 36.55,
       description: "description",
       rating: 4.1,
       isFavourites: false,
       isPopular: true,

       ),
       Product(
         id_: 5,
     images: [
       "assets/images/wireless headset.png"
       ], 
     colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DBB),
      const Color(0xFFDECB9C),
      Colors.white,
      
     ],
      title: "Logitech Head",
       price: 20.20,
       description: "description",
       rating: 4.1,
       isFavourites: false,

       ),
        
       
   

];

class ProductList extends ChangeNotifier{
  static ProductList? __instance;

  List<Product> products = [];
  ProductList._();

  static ProductList getInstance(){
    __instance ??= ProductList._();
    return __instance!;
  }

  set setProducts(pro){
    products = pro;
    notifyListeners();
  }

  get getProducts => products;

  removeProduct(Product product){
    products.remove(product);
    notifyListeners();
  }
  addProduct(Product product){
    products.add(product);
    notifyListeners();

  }

  Product? getProductById(int id){
    try{
      Product product = products.firstWhere((element) => element.id == id);
      return product;
    }on StateError{
      return null;
    }
  }

  double? getProductPriceById(int id){
    try{
      Product product = products.firstWhere((element) => element.id == id);
      return product.price;
    }on StateError{
      return null;
    }
  }


}

class VendorProduct extends ChangeNotifier{
  List<int> __products = [];

  List<int> get products => __products;
  set products(List<int> list){
    __products = list;
    notifyListeners();
  }
  addProduct(int p){
    __products.add(p);
    notifyListeners();
  }

  remove(int p){
    __products.remove(p);
    notifyListeners();
  }






}