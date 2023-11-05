part of 'catagory_bloc.dart';

sealed class CatagoryEvent extends Equatable {
  const CatagoryEvent();

  @override
  List<Object> get props => [];
}

class CatagoryLoadListEvent extends CatagoryEvent {}

class CatagoryCreateEvent extends CatagoryEvent {
  Catagory catagory;
  CatagoryCreateEvent({
    required this.catagory,
  });
  @override
  List<Object> get props => [catagory];
}

class CatagoryUpdateEvent extends CatagoryEvent {
  Catagory catagory;
  CatagoryUpdateEvent({
    required this.catagory,
  });
  @override
  List<Object> get props => [catagory];
}

class CatagoryDeleteEvent extends CatagoryEvent {
  String docId;
  CatagoryDeleteEvent({
    required this.docId,
  });
  @override
  List<Object> get props => [docId];
}
