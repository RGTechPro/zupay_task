import 'dart:convert';

class Product {
  String? itemImage;
  String? itemTitle;
  String? itemCategory;
  double? itemPrice;
  int? id;
  int quantity;
  Product({
    this.itemImage,
    this.itemTitle,
    this.itemCategory,
    this.itemPrice,
    this.id,
    this.quantity=1
  });

  Map<String, dynamic> toMap() {
    return {
      'image': itemImage,
      'ttle': itemTitle,
      'category': itemCategory,
      'price': itemPrice,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      itemImage: map['image'],
      itemTitle: map['title'],
      itemCategory: map['category'],
      itemPrice: map['price']?.toDouble(),
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
