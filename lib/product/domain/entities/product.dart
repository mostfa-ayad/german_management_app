import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String docId;
  final String name;
  final String description;
  final double price;
  final double cost;
  final String imageUrl;
  const Product({
    required this.docId,
    required this.name,
    required this.description,
    required this.price,
    required this.cost,
    required this.imageUrl,
  });
  @override
  List<Object> get props {
    return [
      docId,
      name,
      description,
      price,
      cost,
      imageUrl,
    ];
  }
}
