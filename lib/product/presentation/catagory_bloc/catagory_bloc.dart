import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:german_management_app/product/domain/entities/catagory.dart';

import 'package:german_management_app/product/domain/usecases/create_catagory_usecase.dart';
import 'package:german_management_app/product/domain/usecases/delete_catagory_usecase.dart';
import 'package:german_management_app/product/domain/usecases/get_catagory_list_usecase.dart';
import 'package:german_management_app/product/domain/usecases/update_catagory_usecase.dart';

part 'catagory_event.dart';
part 'catagory_state.dart';

class CatagoryBloc extends Bloc<CatagoryEvent, CatagoryState> {
  CreateCatagoryUsecase createCatagoryUsecase;
  UpdateCatagoryUsecase updateCatagoryUsecase;
  DeleteCatagoryUsecase deleteCatagoryUsecase;
  CatagoryListUsecase catagoryListUsecase;
  CatagoryBloc(
      {required this.createCatagoryUsecase,
      required this.updateCatagoryUsecase,
      required this.deleteCatagoryUsecase,
      required this.catagoryListUsecase})
      : super(CatagoryInitial()) {
    on<CatagoryLoadListEvent>((event, emit) async {
      var either = await catagoryListUsecase.call();
      either.fold((failure) => emit(CatagoryErrorState(msg: failure.msg)),
          (list) => emit(CatagoryLoadListState(list: list)));
    });
    on<CatagoryCreateEvent>((event, emit) async {
      var either = await createCatagoryUsecase.call(event.catagory);
      either.fold((failure) => emit(CatagoryErrorState(msg: failure.msg)),
          (_) => emit(CatagoryActionState(msg: "Create Success")));
    });
    on<CatagoryDeleteEvent>((event, emit) async {
      var either = await deleteCatagoryUsecase.call(event.docId);
      either.fold((failure) => emit(CatagoryErrorState(msg: failure.msg)),
          (_) => emit(CatagoryActionState(msg: "Delete Success")));
    });
    on<CatagoryUpdateEvent>((event, emit) async {
      var either = await updateCatagoryUsecase.call(event.catagory);
      either.fold((failure) => emit(CatagoryErrorState(msg: failure.msg)),
          (_) => emit(CatagoryActionState(msg: "Update Success")));
    });
  }
}
