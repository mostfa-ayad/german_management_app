import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';
import 'package:german_management_app/product/domain/repositories/catagory_repository.dart';

class CreateCatagoryUsecase {
  CatagoryRepository catagoryRepository;
  CreateCatagoryUsecase({
    required this.catagoryRepository,
  });
  Future<FailureOrUnit> call(Catagory catagory) async {
    return await catagoryRepository.createCatagory(catagory);
  }
}
