import 'package:flutter/material.dart';

import '../../../data/models/collection_model.dart';
import '../../pages/photos_page.dart';


Widget itemOfCollection(BuildContext context,Collection collection) {
  return GestureDetector(
    onTap: () {
      callPhotosPage(context,collection);
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
callPhotosPage(BuildContext context, Collection collection) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return PhotosPage(
      collection: collection,
    );
  }));
}