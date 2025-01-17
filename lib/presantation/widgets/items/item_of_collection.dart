import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_bloc.dart';

import '../../../data/models/collection_model.dart';
import '../../pages/photos_page.dart';


Widget itemOfCollection(BuildContext context,Collection collection, CollectionBloc collectionBloc) {
  return GestureDetector(
    onTap: () {
      collectionBloc.callPhotosPage(context,collection);
    },
    child: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(
                collection.coverPhoto.urls.small!,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [Colors.black54, Colors.black12])),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(collection.title!,
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
