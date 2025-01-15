
abstract class HomeState {
  final int currentIndex;

  HomeState({required this.currentIndex});

}
class CurrentIndexState extends HomeState{

  CurrentIndexState({required super.currentIndex});
}

