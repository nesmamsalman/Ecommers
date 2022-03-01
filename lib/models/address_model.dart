class AddressModel {
  String title;
  String street;
  String country;
  String city;
  String description;
  bool isDefault;
  String id;

  AddressModel(
      {this.title,
      this.street,
      this.country,
      this.city,
      this.description,
      this.isDefault,
      this.id});

  AddressModel.fromMap(Map map) {
    this.title = map['title'];
    this.street = map['street'];
    this.country = map['country'];
    this.city = map['city'];
    this.description = map['description'];
    this.isDefault = map['isDefault'];
    this.id = map['id'];
  }

  toMap() {
    return {
      'title': this.title,
      'street': this.street,
      'country': this.country,
      'city': this.city,
      'description': this.description,
      'isDefault': this.isDefault,
      'id': this.id
    };
  }
}
