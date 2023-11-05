part of 'image_cubit_cubit.dart';

sealed class ImageCubitState extends Equatable {
  const ImageCubitState();

  @override
  List<Object> get props => [];
}

final class ImageCubitInitial extends ImageCubitState {}

class ImageCubitLoadImage extends ImageCubitState {}
