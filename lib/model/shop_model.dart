
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<ShopModel> shopModelFromJson(String str) => List<ShopModel>.from(json.decode(str).map((x) => ShopModel.fromJson(x)));

String shopModelToJson(List<ShopModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopModel {

    int shopId;
    String name;
    String description;
    LatLng location;

    ShopModel({
        required this.shopId,
        required this.name,
        required this.description,
        required this.location,
    });

    @override
    String toString(){
      return "$shopId - $name - $description - ${location.latitude} - ${location.longitude}";
    }

    factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        shopId: json["shopId"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "shopId": shopId,
        "name": name,
        "description": description,
        "location": location,
    };

}