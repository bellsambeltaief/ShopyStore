import 'package:flutter/foundation.dart';
import 'package:shopy/models/cm_product.dart';

class CartItem {
  int id;
  int quantity;

  CartItem({required this.id, required this.quantity});

  set setId(int id){
    this.id = id;
  }

  set setQuantity(int q){
    quantity = q;
  }

  get getId => id;
  get getQuantity => quantity;
}

class Cart extends ChangeNotifier{
    List<CartItem> cart = [];

    add(CartItem item){
      try{
        CartItem target = cart.firstWhere((element) => element.getId == item.getId);
        target.setQuantity = target.getQuantity + item.getQuantity;
        notifyListeners();
      }on StateError{
        cart.add(item);
        notifyListeners();
      }
    }

    int idByIndex(int index){
      return cart[index].getId;
    }

    int quantityByIndex(int index){
      return cart[index].getQuantity;
    }

    List<CartItem> get getList => cart;

    remove(int id){
      cart.removeWhere((CartItem item) => item.getId == id);
      notifyListeners();
    }

    clear(){
      cart.clear();
      notifyListeners();
    }

    double getTotalPrice(){
      double price = 0.0;
      for (var element in cart) {
        price += (ProductList.getInstance().getProductPriceById(element.id)?? 0.0)*element.quantity;
      }
      return price;
    }

    int size(){
      return cart.length;
    }

}

