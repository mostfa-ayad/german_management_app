import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:german_management_app/product/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.docId,
      required super.name,
      required super.description,
      required super.price,
      required super.cost,
      required super.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'cost': cost,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      cost: map['cost']?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }
  factory ProductModel.fromQuery(QueryDocumentSnapshot e) {
    var map = e.data() as Map<String, dynamic>;
    return ProductModel(
      docId: e.id ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      cost: map['cost']?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
