class ProductModel {
  String id;
  String name;
  String name_ar;
  String imgURL;
  String description;
  String description_ar;
  num price;
  String categName;
  num amount;

  ProductModel(
      {this.id,
      this.name,
      this.name_ar,
      this.imgURL,
      this.description,
      this.description_ar,
      this.price,
      this.categName});

  ProductModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.name_ar = map['name_ar'];
    this.description = map['description'];
    this.description_ar = map['description_ar'];
    this.price = map['price'];
    this.imgURL = map['imgURL'];
    this.id = map['id'];
    this.categName = map['categName'];
  }

  toMap() {
    return {
      'name': this.name,
      'name_ar': this.name_ar,
      'description': this.description,
      'description_ar': this.description_ar,
      'price': this.price,
      'imgURL': this.imgURL,
      'categName': this.categName,
    };
  }
}
