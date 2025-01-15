// To parse this JSON data, do
//
//     final searchPhotosRes = searchPhotosResFromJson(jsonString);

import 'dart:convert';

import 'package:unsplashblocversion/data/models/photo_model.dart';




SearchPhotosRes searchPhotosResFromJson(String str) => SearchPhotosRes.fromJson(json.decode(str));

String searchPhotosResToJson(SearchPhotosRes data) => json.encode(data.toJson());

class SearchPhotosRes {
  int total;
  int totalPages;
  List<Photo> results;

  SearchPhotosRes({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchPhotosRes.fromJson(Map<String, dynamic> json) => SearchPhotosRes(
    total: json["total"],
    totalPages: json["total_pages"],
    results: List<Photo>.from(json["results"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
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