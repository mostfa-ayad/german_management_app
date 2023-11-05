import 'package:german_management_app/core/my_types.dart';
import 'package:german_management_app/product/domain/repositories/catagory_repository.dart';

class DeleteCatagoryUsecase {
  CatagoryRepository catagoryRepository;
  DeleteCatagoryUsecase({
    required this.catagoryRepository,
  });
  Future<FailureOrUnit> call(String docId) {
    return catagoryRepository.deleteCatagory(docId);
  }
}
