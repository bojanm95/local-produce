// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    int productId;
    String description;
    int productCategoryId;
    bool valid;

    ProductModel({
        required this.productId,
        required this.description,
        required this.productCategoryId,
        required this.valid,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["productId"],
        description: json["description"],
        productCategoryId: json["productCategoryId"],
        valid: json["valid"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "description": description,
        "productCategoryId": productCategoryId,
        "valid": valid,
    };
}
