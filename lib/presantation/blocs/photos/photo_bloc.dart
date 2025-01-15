
import 'package:bloc/bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_event.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_state.dart';
import '../../../data/datasources/remote/http_services.dart';
import '../../../data/models/photo_model.dart';

abstract class PhotoBloc extends Bloc<PhotoEvent, PhotoState>{
  bool isLoading = false;
  List<Photo> items = [];

  PhotoBloc(): super(PhotoInitialState()){
    on<ApiCollectionsPhotosEvent>(_onApiCollectionsPhotosEvent);
  }
  Future<void>_onApiCollectionsPhotosEvent(
      ApiCollectionsPhotosEvent event, Emitter<PhotoState>emit)async {
    emit(PhotoLoadingState());
    var response = await Network.GET(
        Network.API_COLLECTIONS_PHOTOS, Network.paramsCollectionsPhotos(1));
    var result = Network.parseCollectionsPhotos(response!);
    items = result;
    isLoading = false;
  }
  }