import 'package:equatable/equatable.dart';

import '../../../data/models/photo_model.dart';

abstract class SearchState extends Equatable {}

class SearchInitialState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSuccsessState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class ApiSearchPhotosState extends SearchState {
  final List<Photo> items;

  ApiSearchPhotosState(this.items);

  @override
  List<Object?> get props => [];
}

