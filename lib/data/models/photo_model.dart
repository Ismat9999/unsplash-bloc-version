

import 'collection_model.dart';

class Photo {
  String id;
  String? description;
  Urls urls;

  Photo({
    required this.id,
    required this.description,
    required this.urls,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    description: json["description"],
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "urls": urls.toJson(),
  };
}