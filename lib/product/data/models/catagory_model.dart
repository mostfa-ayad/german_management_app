import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';

class CatagoryModel extends Catagory {
  CatagoryModel(
      {required super.docId,
      required super.name,
      required super.description,
      required super.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory CatagoryModel.fromQuery(QueryDocumentSnapshot queryDocumentSnapshot) {
    var map = queryDocumentSnapshot.data() as Map<String, dynamic>;
    return CatagoryModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
  factory CatagoryModel.fromMap(Map<String, dynamic> map) {
    return CatagoryModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatagoryModel.fromJson(String source) =>
      CatagoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Catagory(docId: $docId, name: $name, description: $description, imageUrl: $imageUrl)';
  }
}
