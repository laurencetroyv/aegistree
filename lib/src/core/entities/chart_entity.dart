import 'package:flutter/material.dart';

class ChartEntity {
  final String name;
  final String month;
  final double value;
  final Color color;

  ChartEntity({
    required this.name,
    required this.month,
    required this.value,
    required this.color,
  });
}

class OrderProductModel {
  String id, name, image;
  int quantity, singlePrice, totalPrice;

  OrderProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.singlePrice,
    required this.totalPrice,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'] ?? 0,
      singlePrice: json['single_price'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'quantity': quantity,
      'single_price': singlePrice,
      'total_price': totalPrice,
    };
  }
}
