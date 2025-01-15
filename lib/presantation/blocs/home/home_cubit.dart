
import 'package:bloc/bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/home/home_state.dart';

 class HomeCubit extends Cubit<HomeState> {
   HomeCubit(): super(CurrentIndexState(currentIndex: 0));

     void onBottomChange(int index) {
       emit(CurrentIndexState(currentIndex: index));
     }

   void onPageViewChange(int index) {
     emit(CurrentIndexState(currentIndex: index));
   }
   }
