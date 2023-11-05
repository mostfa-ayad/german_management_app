import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:german_management_app/product/domain/entities/product.dart';

import 'package:german_management_app/product/domain/usecases/create_product_usecase.dart';
import 'package:german_management_app/product/domain/usecases/delete_product_usecase.dart';
import 'package:german_management_app/product/domain/usecases/get_product_list_usecase.dart';
import 'package:german_management_app/product/domain/usecases/update_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductListUsecase getProductListUsecase;
  CreateProductUsecase createProductUsecase;
  UpdateProductUsecase updateProductUsecase;
  DeleteProductUsecase deleteProductUsecase;
  ProductBloc({
    required this.getProductListUsecase,
    required this.createProductUsecase,
    required this.updateProductUsecase,
    required this.deleteProductUsecase,
  }) : super(ProductInitial()) {
    on<ProductLoadListgEvent>((event, emit) async {
      emit(ProductLoadingState());
      await Future.delayed(const Duration(seconds: 1)).then((value) async {
        var either = await getProductListUsecase.call();
        either.fold((failure) => emit(ProductErrorState(msg: failure.msg)),
            (list) => emit(ProductLoadListState(list: list)));
      });
    });
    on<ProductCreateEvent>(
      (event, emit) async {
        var either = await createProductUsecase.call(event.product);
        either.fold((failure) => emit(ProductErrorState(msg: failure.msg)),
            (_) => emit(const ProductActionState(msg: "Created Success")));
      },
    );
    on<ProductDeleteEvent>(
      (event, emit) async {
        var either = await deleteProductUsecase.call(event.docId);
        either.fold((failure) => emit(ProductErrorState(msg: failure.msg)),
            (_) => emit(const ProductActionState(msg: "Deleted Success")));
      },
    );
    on<ProductEditEvent>(
      (event, emit) async {
        var either = await updateProductUsecase.call(event.product);
        either.fold((failure) => emit(ProductErrorState(msg: failure.msg)),
            (_) => emit(const ProductActionState(msg: "Updated Success")));
      },
    );
  }
}
