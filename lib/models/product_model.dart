part of 'models.dart';

class ProductModel {
  String? name;
  String? price;
  String? cover;
  String? desc;

  ProductModel({this.name, this.price, this.cover, this.desc});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"],
        price: json["price"].toString(),
        cover: json["cover"],
        desc: json["desc"]
    );
  }
}