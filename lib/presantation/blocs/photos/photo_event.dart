import '../../../data/models/collection_model.dart';
import '../../../data/models/photo_model.dart';

abstract class PhotoEvent {}

class ApiCollectionsPhotosEvent extends PhotoEvent {
  final Collection? collection;

  ApiCollectionsPhotosEvent(this.collection);
  @override
  List<Object> get props => [];
}
