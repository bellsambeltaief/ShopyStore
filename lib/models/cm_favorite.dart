
import 'package:flutter/material.dart';

List<int> favorite = [
  
];

class Favorite extends ChangeNotifier{
  final List<int> __favorite = [

  ];


  get favorite => __favorite;

  addProduct(int id){
    if (__favorite.indexOf(id) > 0){
      return;
    }
    __favorite.add(id);
    notifyListeners();
  }

  deleteProduct(int id){
    __favorite.remove(id);
    notifyListeners();
  }



}