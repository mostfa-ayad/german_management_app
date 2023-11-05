import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/entities/product.dart';
import 'package:german_management_app/product/domain/repositories/product_repository.dart';

class CreateProductUsecase {
  ProductRepository productRepository;
  CreateProductUsecase({
    required this.productRepository,
  });
  Future<FailureOrUnit> call(Product product) {
    return productRepository.createProduct(product);
  }
}
