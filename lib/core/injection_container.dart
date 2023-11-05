import 'package:german_management_app/auth/data/datasources/user_data_source.dart';
import 'package:german_management_app/auth/data/repositories/user_repository_impl.dart';
import 'package:german_management_app/auth/domain/repositories/user_repository.dart';
import 'package:german_management_app/auth/domain/usecases/create_user_with_name_and_email_usecase.dart';
import 'package:german_management_app/auth/domain/usecases/login_with_email.dart';
import 'package:german_management_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:german_management_app/product/data/datasources/catagory_datasource.dart';
import 'package:german_management_app/product/data/datasources/product_datasource.dart';
import 'package:german_management_app/product/data/repositories/catagory_repository_impl.dart';
import 'package:german_management_app/product/data/repositories/product_repository_impl.dart';
import 'package:german_management_app/product/domain/repositories/catagory_repository.dart';
import 'package:german_management_app/product/domain/repositories/product_repository.dart';
import 'package:german_management_app/product/domain/usecases/create_catagory_usecase.dart';
import 'package:german_management_app/product/domain/usecases/create_product_usecase.dart';
import 'package:german_management_app/product/domain/usecases/delete_catagory_usecase.dart';
import 'package:german_management_app/product/domain/usecases/delete_product_usecase.dart';
import 'package:german_management_app/product/domain/usecases/get_catagory_list_usecase.dart';
import 'package:german_management_app/product/domain/usecases/get_product_list_usecase.dart';
import 'package:german_management_app/product/domain/usecases/update_catagory_usecase.dart';
import 'package:german_management_app/product/domain/usecases/update_product_usecase.dart';
import 'package:german_management_app/product/presentation/catagory_bloc/catagory_bloc.dart';
import 'package:german_management_app/product/presentation/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;
Future<void> init() async {
  //bloc
  _authModelInjection();
  _productModelInjection();
  _catagoryModelInjection();
}

_authModelInjection() {
  sl.registerFactory(() => AuthBloc(
      createUserWithEmailAndPasswordUsecase: sl(), loginWithEmail: sl()));
  //repo
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(dataSource: sl()));
  //usecases
  sl.registerLazySingleton(
      () => CreateUserWithEmailAndPasswordUsecase(repository: sl()));
  sl.registerLazySingleton(() => LoginWithEmail(repository: sl()));

  sl.registerLazySingleton<UserDataSource>(() => UserFirebaseDataSource());
}

_productModelInjection() {
  sl.registerFactory(() => ProductBloc(
      createProductUsecase: sl(),
      deleteProductUsecase: sl(),
      getProductListUsecase: sl(),
      updateProductUsecase: sl()));

  //repo
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(datasource: sl()));
  //datasource
  sl.registerLazySingleton<ProductDatasource>(
      () => ProductFirebaseDatasource());
  //usecases
  sl.registerLazySingleton(
      () => GetProductListUsecase(productRepository: sl()));
  sl.registerLazySingleton(() => CreateProductUsecase(productRepository: sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(productRepository: sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(productRepository: sl()));
}

_catagoryModelInjection() {
  sl.registerFactory(() => CatagoryBloc(
      createCatagoryUsecase: sl(),
      updateCatagoryUsecase: sl(),
      deleteCatagoryUsecase: sl(),
      catagoryListUsecase: sl()));

  sl.registerLazySingleton<CatagoryRepository>(
      () => CatagoryRepositoryImpl(catagorytDatasource: sl()));
  sl.registerLazySingleton<CatagorytDatasource>(
      () => CatagoryFirebaseDatasource());

  sl.registerLazySingleton(
      () => CreateCatagoryUsecase(catagoryRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteCatagoryUsecase(catagoryRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateCatagoryUsecase(catagoryRepository: sl()));
  sl.registerLazySingleton(() => CatagoryListUsecase(catagoryRepository: sl()));
}
