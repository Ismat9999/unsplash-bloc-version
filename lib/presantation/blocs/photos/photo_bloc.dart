import 'package:bloc/bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_event.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_state.dart';
import '../../../core/services/log_service.dart';
import '../../../data/datasources/remote/http_services.dart';
import '../../../data/models/photo_model.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  bool isLoading = false;
  List<Photo> items = [];
  String id="sPgfgvR6DMo";

  PhotoBloc() : super(PhotoInitialState()) {
    on<ApiCollectionsPhotosEvent>(_onApiCollectionsPhotosEvent);
  }

  Future<void> _onApiCollectionsPhotosEvent(
      ApiCollectionsPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoadingState());
    var response = await Network.GET(
        Network.API_COLLECTIONS_PHOTOS
            .replaceFirst(":id", id),
        Network.paramsCollectionsPhotos(1));
    LogService.i(response!);
    var result = Network.parseCollectionsPhotos(response);
    items = result;
    emit(ApiPhotosState(items));
  }
}
