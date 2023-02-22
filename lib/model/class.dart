// model 
class Fruit {
  int? id;
  String? name;
  String? images;
  String? kg;
  String? price;
  Fruit({this.id, this.name, this.images, this.kg, this.price});
  Fruit.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        images = res["images"],
        kg = res["kg"],
        price = res["price"];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'images': images, 'kg': kg, 'price': price};
  }
}