// To parse this JSON data, do
//
//     final productrModel = productrModelFromJson(jsonString);

import 'dart:convert';

ProductrModel productrModelFromJson(String str) => ProductrModel.fromJson(json.decode(str));

String productrModelToJson(ProductrModel data) => json.encode(data.toJson());

class ProductrModel {
  ProductrModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.dateTime,
  });

  int? id;
  String? title;
  int? price;
  String? description;
  String? dateTime;

  factory ProductrModel.fromJson(Map<String, dynamic> json) => ProductrModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    dateTime: json["dateTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "dateTime": dateTime,
  };
}
