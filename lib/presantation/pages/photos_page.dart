import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_event.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_state.dart';
import '../../data/models/collection_model.dart';
import '../blocs/photos/photo_bloc.dart';
import '../widgets/items/item_of_photo.dart';


class PhotosPage extends StatefulWidget {
  final Collection? collection;

  const PhotosPage({super.key, this.collection});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
late PhotoBloc photoBloc;
  @override
  void initState() {
    super.initState();
    photoBloc= BlocProvider.of<PhotoBloc>(context);
    photoBloc.add(ApiCollectionsPhotosEvent());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.collection!.title!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context,index){
          return Stack(
            children: [
              MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: photoBloc.items.length,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (ctx, index) {
                  return itemOfPhoto(context,photoBloc.items[index], index);
                },
              ),

              photoBloc.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}