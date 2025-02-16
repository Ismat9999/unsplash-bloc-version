import 'package:equatable/equatable.dart';

import '../../../data/models/photo_model.dart';

abstract class CollectionState  extends Equatable {}

class CollectionInitialState extends CollectionState{
  @override
  List<Object?> get props => [];
}
class CollectionLoadingState extends CollectionState{
  @override
  List<Object?> get props => [];
}
class CollectionSuccsessState extends CollectionState{
  @override
  List<Object?> get props => [];
}
class CollectionErrorState extends CollectionState{
  final String errorMessage;

  CollectionErrorState(this.errorMessage);
  @override
  List<Object?> get props => [];
}
class ApiCollectionPhotosState extends CollectionState {
  final List<Photo> items;
  ApiCollectionPhotosState(this.items);

  @override
  List<Object?> get props => [];
}