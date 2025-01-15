import 'package:flutter/material.dart';
import '../../../data/models/photo_model.dart';
import '../../pages/details_page.dart';

Widget itemOfPhoto(BuildContext context, Photo photo, index ) {
  return GestureDetector(
    onTap: () {
      _callDetailsPage(context,photo);
    },
    child: Container(
      height: (index % 5 + 5) * 50.0,
      child: Image.network(
        photo.urls.small!,
        fit: BoxFit.cover,
      ),
    ),
  );
}
_callDetailsPage(BuildContext context,Photo photo) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return DetailsPage(
      photo: photo,
    );
  }));
}