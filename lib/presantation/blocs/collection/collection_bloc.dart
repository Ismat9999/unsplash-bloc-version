

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_event.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_state.dart';

import '../../../core/services/log_service.dart';
import '../../../data/datasources/remote/http_services.dart';
import '../../../data/models/collection_model.dart';
import '../../pages/photos_page.dart';
import '../photos/photo_bloc.dart';
 class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
   bool isLoading = false;
   List<Collection> items = [];

   CollectionBloc() : super(CollectionInitialState()) {
     on<ApiCollectionListEvent>(_onApiCollectionListEvent);
   }

   Future<void> _onApiCollectionListEvent(ApiCollectionListEvent event,
       Emitter<CollectionState>emit) async {
     emit(CollectionLoadingState());
     var response = await Network.GET(
         Network.API_COLLECTIONS, Network.paramsCollections(1));
     var result = Network.parseCollections(response!);
     LogService.i(response!);
   }

   callPhotosPage(BuildContext context, Collection collection) {
     Navigator.of(context)
         .push(MaterialPageRoute(builder: (BuildContext context) {
       return BlocProvider(
         create: (context) => PhotoBloc(),
         child: PhotosPage(
           collection: collection,
         ),
       );
     }));
   }
 }