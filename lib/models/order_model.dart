import 'package:mns/models/address_model.dart';
import 'package:mns/models/cart_model.dart';

class OrderModel {
  String orderID;
  String state;
  String totalPrice;
  List<CartModel> cart = [];
  AddressModel address;

  String cardNum;
  String expirationDate;
  String cvv;

  OrderModel({
    this.orderID,
    this.state = 'Approved',
    this.totalPrice,
    this.cart,
    this.address,
    this.cardNum,
    this.expirationDate,
    this.cvv,
  });

  OrderModel.fromMap(Map map) {
    this.orderID = map['orderID'];
    this.state = map['state'];
    this.totalPrice = map['totalPrice'];
    // this.cart = CartModel.fromMap(map['cart']) as List<CartModel>;
    cart = <CartModel>[];
    map['cart'].forEach((v) {
      cart.add(new CartModel.fromMap(v));
    });

    this.address = AddressModel.fromMap(map['address']);
    this.cardNum = map['cardNum'];
    this.expirationDate = map['expirationDate'];
    this.cvv = map['cvv'];
  }

  toMap() {
    return {
      'orderID': this.orderID,
      'state': this.state,
      'totalPrice': this.totalPrice,
      // 'cart': this.cart.toList().asMap(),
      'cart': this.cart.map((v) => v.toMap()).toList(),
      'address': this.address.toMap(),
      'cardNum': this.cardNum,
      'expirationDate': this.expirationDate,
      'cvv': this.cvv
    };
  }
}
