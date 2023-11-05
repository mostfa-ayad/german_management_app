part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadListState extends ProductState {
  final List<Product> list;
  const ProductLoadListState({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class ProductErrorState extends ProductState {
  final String msg;
  const ProductErrorState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}

class ProductActionState extends ProductState {
  final String msg;
  const ProductActionState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
