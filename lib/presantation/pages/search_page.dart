import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplashblocversion/presantation/blocs/search/search_state.dart';
import '../../core/services/log_service.dart';
import '../blocs/search/search_bloc.dart';
import '../blocs/search/search_event.dart';
import '../widgets/items/item_of_photo.dart';


class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading = false;
  late SearchBloc searchBloc;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchBloc = (context).read<SearchBloc>();
    searchBloc.add(ApiSearchPhotosEvent());


    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
          scrollController.offset) {
        LogService.i(searchBloc.currentPage.toString());
        searchBloc.add(ApiSearchPhotosEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 30,
                    child: Icon(Icons.search, color: Colors.white,),
                  ),
                  Expanded(child: Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: searchBloc.textEditingController,
                      decoration: InputDecoration(
                        hintText: "Search photos, collections, users",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (value){
                        searchBloc.add(SearchQueryEvent(query: ''));

                      },
                    ),
                  ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Stack(
            children: [
              MasonryGridView.builder(
                controller: scrollController,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: searchBloc.items.length,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (context, index) {
                  return itemOfPhoto(
                      context, searchBloc.items[index], index);
                },
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator(),)
                  : SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
