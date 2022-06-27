
class products {
  int? id;
  String? name;
  double? price;
  String? photo;
  String? description;

  products({this.id, this.name, this.price, this.photo, this.description});

  products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    photo = json['photo'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['photo'] = this.photo;
    data['description'] = this.description;
    return data;
  }
}
