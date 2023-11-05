import 'package:equatable/equatable.dart';

class Catagory extends Equatable {
  String docId;
  String name;
  String description;
  String imageUrl;
  Catagory({
    required this.docId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [docId, name, description, imageUrl];
}
