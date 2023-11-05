part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadListgEvent extends ProductEvent {}

class ProductCreateEvent extends ProductEvent {
  final Product product;
  const ProductCreateEvent({
    required this.product,
  });
}

class ProductDeleteEvent extends ProductEvent {
  final String docId;
  const ProductDeleteEvent({
    required this.docId,
  });
}

class ProductEditEvent extends ProductEvent {
  final Product product;
  const ProductEditEvent({
    required this.product,
  });
}
