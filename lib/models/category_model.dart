class CategModel {
  String name;
  String name_ar;
  String imgURL;
  String categID;

  CategModel({this.name, this.imgURL, this.categID});

  CategModel.fromMap(Map map) {
    this.name = map['name'];
    this.name_ar = map['name_ar'];
    this.imgURL = map['imgURL'];
    this.categID = map['categID'];
  }

  toMap() {
    return {
      'name': this.name,
      'imgURL': this.imgURL,
      'name_ar': this.name_ar,
    };
  }
}
