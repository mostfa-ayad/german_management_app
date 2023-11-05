import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/product/domain/entities/product.dart';
import 'package:german_management_app/product/domain/repositories/product_repository.dart';

class GetProductListUsecase {
  ProductRepository productRepository;
  GetProductListUsecase({
    required this.productRepository,
  });
  Future<Either<Failure, List<Product>>> call() {
    return productRepository.getProductList();
  }
}
