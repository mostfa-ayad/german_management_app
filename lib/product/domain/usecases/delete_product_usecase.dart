import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/repositories/product_repository.dart';

class DeleteProductUsecase {
  ProductRepository productRepository;
  DeleteProductUsecase({
    required this.productRepository,
  });
  Future<FailureOrUnit> call(String docId) {
    return productRepository.deleteProduct(docId);
  }
}
