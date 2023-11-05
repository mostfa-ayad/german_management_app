import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';

abstract class CatagoryRepository {
  Future<Either<Failure, List<Catagory>>> getCatagoryList();
  Future<FailureOrUnit> createCatagory(Catagory catagory);
  Future<FailureOrUnit> deleteCatagory(String docId);
  Future<FailureOrUnit> updateCatagory(Catagory catagory);
}
