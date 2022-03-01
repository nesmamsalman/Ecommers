import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:grocery_app/models/address_model.dart';
// import 'package:grocery_app/models/cart_model.dart';
// import 'package:grocery_app/models/product_model.dart';

class GdUser {
  String id;
  String name;
  String phone;
  String email;
  String password;
  String confirmpassword;
  // List<CartModel> cartList;
  // List<ProductModel> favList;
  // List<AddressModel> addressesList;
  String imgURL;
  File imageToBeUpload;

  GdUser(
      {this.id,
      this.name, //@required
      this.phone, //@required
      this.email, //@required
      this.password, 
      this.confirmpassword,//@required
      // this.cartList,
      // this.favList,
      // this.addressesList,
      this.imgURL,
      this.imageToBeUpload});

  GdUser.fromMap(Map map) {
    this.name = map['name'];
    this.phone = map['phone'];
    this.email = map['email'];
    this.id = map['id'];
    this.imgURL = map['imgURL'];
    // this.cartList = map['cartList'];
    // this.favList = map['favList'];
    // this.addressesList = map['addressesList'];
  }
  toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      // 'cartList': this.cartList,
      // 'favList': this.favList,
      // 'addressesList': this.addressesList,
      'id': this.id,
      'imgURL': this.imgURL,
    };
  }
}
