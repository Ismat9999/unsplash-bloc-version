// To parse this JSON data, do
//
//     final collectionListRes = collectionListResFromJson(jsonString);

import 'dart:convert';

List<Collection> collectionListResFromJson(String str) => List<Collection>.from(json.decode(str).map((x) => Collection.fromJson(x)));

String collectionListResToJson(List<Collection> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Collection {
  String id;
  String title;
  String? description;
  CollectionListReCoverPhoto coverPhoto;

  Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.coverPhoto,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    coverPhoto: CollectionListReCoverPhoto.fromJson(json["cover_photo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "cover_photo": coverPhoto.toJson(),
  };
}

class CollectionListReCoverPhoto {
  Urls urls;

  CollectionListReCoverPhoto({
    required this.urls,
  });

  factory CollectionListReCoverPhoto.fromJson(Map<String, dynamic> json) => CollectionListReCoverPhoto(
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "urls": urls.toJson(),
  };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}