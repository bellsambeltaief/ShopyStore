import 'package:flutter/cupertino.dart';

class CmUser extends ChangeNotifier{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  bool? vendor;
  CmUser({this.id, this.email, this.firstName, this.lastName, this.address, this.phoneNumber, this.vendor,
  });

  Map<String, dynamic> get getUser => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "phoneNumber": phoneNumber,
    "vendor": vendor

  };

  String get getFirstName => firstName ?? "";
  String get getLastName => lastName ?? "";
  String get getAddress => address ?? "";
  String get getPhoneNumber => phoneNumber ?? "";
  bool get isVendor => vendor ?? false;
  String get getEmail => email ?? "";
  int? get getId => id;

  void logout(){
    setUser = {'id': null, 'first_name': null, 'last_name': null, 'email': null, 'vendor': null, 'address': null, 'phone_number': null};
    notifyListeners();
  }

  set setUser(Map<String, dynamic> user){
    id = user["id"];
    firstName = user["first_name"];
    lastName = user["last_name"];
    address = user["address"];
    phoneNumber = user["phone_number"];
    email = user["email"];
    vendor = user["vendor"];
    notifyListeners();
}

  set setFirstName(String name){
    firstName = name;
    notifyListeners();
  }

  set setLastName(String name){
    lastName = name;
    notifyListeners();

  }

  set setAddress(String address){
    this.address = address;
    notifyListeners();

  }

  set setEmail(String email){
    this.email = email;
    notifyListeners();
  }

  set setPhoneNumber(String phone){
    phoneNumber = phone;
    notifyListeners();

  }

}