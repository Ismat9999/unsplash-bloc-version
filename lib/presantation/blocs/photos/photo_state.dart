import 'package:equatable/equatable.dart';
import '../../../data/models/photo_model.dart';

abstract class PhotoState extends Equatable {}

class PhotoInitialState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoLoadingState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoSuccessState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoErrorState extends PhotoState {
  final String errorMessage;

  PhotoErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class ApiPhotosState extends PhotoState {
  final List<Photo> items;

  ApiPhotosState(this.items);

  @override
  List<Object?> get props => [];
}
