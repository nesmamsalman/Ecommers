import 'package:mns/models/product_model.dart';

class CartModel {
  num amount;
  String productID;
  ProductModel product;

  CartModel({
    this.amount,
    this.productID,
    this.product,
  });

  CartModel.fromMap(Map map) {
    this.amount = map['amount'];
    this.productID = map['productID'];
    this.product = ProductModel.fromMap(map['product']);
  }
  toMap() {
    return {
      'amount': this.amount,
      'productID': this.productID,
      'product': this.product.toMap(),
    };
  }
}
