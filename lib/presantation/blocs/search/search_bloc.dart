import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:unsplashblocversion/presantation/blocs/search/search_event.dart';
import 'package:unsplashblocversion/presantation/blocs/search/search_state.dart';

import '../../../data/datasources/remote/http_services.dart';
import '../../../data/models/photo_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<Photo> items = [];
  int currentPage = 1;
  String search= "office";
   final TextEditingController? textEditingController = TextEditingController();

  SearchBloc() : super(SearchInitialState()) {
    on<ApiSearchPhotosEvent>(_onApiSearchPhotos);
     on<SearchQueryEvent>(_onSearchQueryEvent);
  }

  Future<void> _onApiSearchPhotos(
      ApiSearchPhotosEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    var response = await Network.GET(Network.API_SEARCH_PHOTOS,
        Network.paramsSearchPhotos(search, currentPage));
    if (response != null) {
      var result = Network.parseSearchPhotos(response).results;
      items.addAll(result);
      currentPage++;
      emit(ApiSearchPhotosState(items));
    } else {
      emit(SearchErrorState("Couldn't fetch photos"));
    }
  }

  Future<void> _onSearchQueryEvent(
      SearchQueryEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
      items.clear();
      if(textEditingController!.text != ''){
        search = textEditingController!.text;
        emit(ApiSearchPhotosState(items));
      }
      add(ApiSearchPhotosEvent());
    }
  }

