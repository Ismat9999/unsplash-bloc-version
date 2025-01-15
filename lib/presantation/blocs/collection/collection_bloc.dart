

import 'package:bloc/bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_event.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_state.dart';

import '../../../core/services/log_service.dart';
import '../../../data/datasources/remote/http_services.dart';
import '../../../data/models/collection_model.dart';

abstract class CollectionBloc extends Bloc<CollectionEvent, CollectionState>{
  bool isLoading = false;
  List<Collection> items = [];

  CollectionBloc(): super(CollectionInitialState()){
    on<ApiCollectionListEvent>(_onApiCollectionListEvent);
  }

  Future<void>_onApiCollectionListEvent(
  ApiCollectionListEvent event, Emitter<CollectionState>emit)async{
    emit(CollectionLoadingState());
    var response = await Network.GET(
        Network.API_COLLECTIONS, Network.paramsCollections(1));
    var result = Network.parseCollections(response!);
    LogService.i(response!);

    items = result;
    isLoading = false;
  }
}
