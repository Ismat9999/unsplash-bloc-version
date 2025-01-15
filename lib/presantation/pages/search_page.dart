import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/services/log_service.dart';
import '../blocs/search/search_bloc.dart';
import '../blocs/search/search_event.dart';
import '../blocs/search/search_state.dart';
import '../widgets/items/item_of_photo.dart';


class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading =false;
  late SearchBloc searchBloc;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchBloc= BlocProvider.of<SearchBloc>(context);
    searchBloc.add(ApiSearchPhotosEvent());

    scrollController.addListener((){
      if (scrollController.position.maxScrollExtent<= scrollController.offset){
        LogService.i(searchBloc.currentPage.toString());
        searchBloc.add(ApiSearchPhotosEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
      // appBar: SearchBar(
      //   backgroundColor: WidgetStateProperty.all(Colors.grey[400]),
      //   shape: WidgetStateProperty.all(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //   ),
      //   padding: WidgetStateProperty.all(
      //     EdgeInsets.symmetric(horizontal: 16.0),
      //   ),
      //   onTap: (){},
      // ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state){
          return Stack(
            children: [
              MasonryGridView.builder(
                controller: scrollController,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (ctx,index){
                  return itemOfPhoto(context, searchBloc.items[index], index);
                },
              ),
              isLoading ? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
            ],
          );
        }
      ),
    );
  }
}
