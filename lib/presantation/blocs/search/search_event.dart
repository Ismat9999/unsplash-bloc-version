
import 'package:equatable/equatable.dart';

abstract class SearchEvent extends  Equatable{
  const SearchEvent();
}

class ApiSearchPhotosEvent extends SearchEvent {
  @override
  List<Object> get props=> [];
}