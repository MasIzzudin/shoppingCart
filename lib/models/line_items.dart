import 'dart:convert';

class LineItems {
  int? id;
  String? productName;
  String? productType;
  int? productCategoryId;
  num? quantity;
  num? price;

  LineItems(
      {this.id,
      this.productName,
      this.productType,
      this.productCategoryId,
      this.quantity,
      this.price});

  factory LineItems.fromRawJson(String str) =>
      LineItems.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
        id: json["id"],
        productName: json["product_name"],
        productType: json["product_type"],
        productCategoryId: json["product_category_id"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_type": productType,
        "product_category_id": productCategoryId,
        "quantity": quantity,
        "price": price,
      };
}
