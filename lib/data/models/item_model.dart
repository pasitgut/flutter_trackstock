import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Item {
  final String id;
  final String name;
  final int quantity;
  final String categoryId;
  final String type; //reusable or consumable
  final String unit;
  final int minQuantity;
  final String location;
  final DateTime createAt;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.type,
    required this.categoryId,
    required this.unit,
    required this.minQuantity,
    required this.location,
    required this.createAt,
  });

  factory Item.fromMap(Map<String, dynamic> map, String id) {
    return Item(
      id: id,
      name: map['itemName'] ?? '',
      quantity: map['quantity'] ?? 0,
      type: map['type'] ?? '',
      categoryId: map['categoryId'] ?? '',
      unit: map['unit'] ?? '',
      minQuantity: map['minQuantity'] ?? 0,
      location: map['location'] ?? '',
      createAt: (map['createAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': name,
      'quantity': quantity,
      'categoryId': categoryId,
      'type': type,
      'unit': unit,
      'minQuantity': minQuantity,
      'location': location,
      'createAt': createAt,
    };
  }

  Item copyWith({
    String? id,
    String? name,
    int? quantity,
    String? categoryId,
    String? type,
    String? unit,
    int? minQuantity,
    String? location,
    DateTime? createAt,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      minQuantity: minQuantity ?? this.minQuantity,
      location: location ?? this.location,
      createAt: createAt ?? this.createAt,
    );
  }
}
