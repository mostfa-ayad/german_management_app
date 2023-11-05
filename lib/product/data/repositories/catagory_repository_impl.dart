import 'package:dartz/dartz.dart';

import 'package:german_management_app/core/error/exception.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/data/datasources/catagory_datasource.dart';
import 'package:german_management_app/product/data/models/catagory_model.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';
import 'package:german_management_app/product/domain/repositories/catagory_repository.dart';

class CatagoryRepositoryImpl extends CatagoryRepository {
  CatagorytDatasource catagorytDatasource;
  CatagoryRepositoryImpl({
    required this.catagorytDatasource,
  });
  @override
  Future<FailureOrUnit> createCatagory(Catagory catagory) async {
    try {
      await catagorytDatasource.createCatagory(CatagoryModel(
          docId: catagory.docId,
          name: catagory.name,
          description: catagory.description,
          imageUrl: catagory.imageUrl));
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<FailureOrUnit> deleteCatagory(String docId) async {
    try {
      await catagorytDatasource.deleteCatagory(docId);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Catagory>>> getCatagoryList() async {
    try {
      return Right(await catagorytDatasource.getCatagoryList());
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }

  @override
  Future<FailureOrUnit> updateCatagory(Catagory catagory) async {
    try {
      await catagorytDatasource.updateCatagory(CatagoryModel(
          docId: catagory.docId,
          name: catagory.name,
          description: catagory.description,
          imageUrl: catagory.imageUrl));
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
