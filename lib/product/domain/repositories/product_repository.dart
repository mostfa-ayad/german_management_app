import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList();
  Future<FailureOrUnit> createProduct(Product product);
  Future<FailureOrUnit> deleteProduct(String docId);
  Future<FailureOrUnit> updateProduct(Product product);
}
