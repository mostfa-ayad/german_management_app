import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/exception.dart';

import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/data/datasources/product_datasource.dart';
import 'package:german_management_app/product/data/models/product_model.dart';
import 'package:german_management_app/product/domain/entities/product.dart';
import 'package:german_management_app/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductDatasource datasource;
  ProductRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<FailureOrUnit> createProduct(Product product) async {
    try {
      await datasource.createProduct(ProductModel(
          docId: product.docId,
          name: product.name,
          description: product.description,
          price: product.price,
          cost: product.cost,
          imageUrl: product.imageUrl));
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<FailureOrUnit> deleteProduct(String docId) async {
    try {
      await datasource.deleteProduct(docId);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    try {
      return Right(await datasource.getProductList());
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<FailureOrUnit> updateProduct(Product product) async {
    try {
      await datasource.updateProduct(ProductModel(
          docId: product.docId,
          name: product.name,
          description: product.description,
          price: product.price,
          cost: product.cost,
          imageUrl: product.imageUrl));
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }
}
