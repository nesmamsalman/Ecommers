import 'package:mns/models/product_model.dart';

class FavModel {
  String productID;

  FavModel({
    this.productID,
  });

  FavModel.fromMap(Map map) {
    this.productID = map['productID'];
  }
  toMap() {
    return {
      'productID': this.productID,
    };
  }
}
