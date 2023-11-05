import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';
import 'package:german_management_app/product/domain/repositories/catagory_repository.dart';

class CatagoryListUsecase {
  CatagoryRepository catagoryRepository;
  CatagoryListUsecase({
    required this.catagoryRepository,
  });
  Future<Either<Failure, List<Catagory>>> call() async {
    return catagoryRepository.getCatagoryList();
  }
}
