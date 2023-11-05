import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_cubit_state.dart';

class ImageCubitCubit extends Cubit<ImageCubitState> {
  String imageUrl = "";
  ImageCubitCubit() : super(ImageCubitInitial());
  loadImage(String imageUrl) {
    this.imageUrl = imageUrl;
    emit(ImageCubitInitial());
    if (imageUrl != "") {
      emit(ImageCubitLoadImage());
    }
  }
}
