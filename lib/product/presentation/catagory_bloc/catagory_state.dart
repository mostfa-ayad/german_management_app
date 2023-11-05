part of 'catagory_bloc.dart';

sealed class CatagoryState extends Equatable {
  const CatagoryState();

  @override
  List<Object> get props => [];
}

final class CatagoryInitial extends CatagoryState {}

class CatagoryLoadListState extends CatagoryState {
  List<Catagory> list;
  CatagoryLoadListState({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class CatagoryLoadingState extends CatagoryState {}

class CatagoryActionState extends CatagoryState {
  String msg;
  CatagoryActionState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}

class CatagoryErrorState extends CatagoryState {
  String msg;
  CatagoryErrorState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
