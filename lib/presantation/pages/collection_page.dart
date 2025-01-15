import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_event.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_state.dart';

import '../widgets/items/item_of_collection.dart';


class CollectionPage extends StatefulWidget {
  static const String id = "collection_page";

  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late CollectionBloc collectionBloc;


  @override
  void initState() {
    super.initState();
    collectionBloc= BlocProvider.of<CollectionBloc>(context);
    collectionBloc.add(ApiCollectionListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Unsplash",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.pix_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state){
          return Stack(
            children: [
              ListView.builder(
                itemCount: collectionBloc.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfCollection(context,collectionBloc.items[index]);
                },
              ),

              collectionBloc.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }


}