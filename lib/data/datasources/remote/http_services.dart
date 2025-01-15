
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import '../../models/collection_model.dart';
import '../../models/photo_model.dart';
import '../../models/search_model.dart';
import 'http_helper.dart';

class Network {
  static String BASE = "api.unsplash.com";

  static final client = InterceptedClient.build(
    interceptors: [HttpInterceptor()],
    retryPolicy: HttpRetryPolicy(),
  );

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api, params);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static _throwException(Response response) {
    String reason = response.reasonPhrase!;
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(reason);
      case 401:
        throw InvalidInputException(reason);
      case 403:
        throw UnauthorisedException(reason);
      case 404:
        throw FetchDataException(reason);
      case 500:
      default:
        throw FetchDataException(reason);
    }
  }

  /* Http Apis*/
  static String API_SEARCH_PHOTOS = "/search/photos";
  static String API_COLLECTIONS = "/collections";
  static String API_COLLECTIONS_PHOTOS = "/collections/:id/photos";

  /* Http Params */
  static Map<String, String> paramsPhotos(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '20',
      'order_by': 'latest',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsSearchPhotos(String query, int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'query': query,
      'page': currentPage.toString(),
      'per_page': '20',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsCollections(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '10',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsCollectionsPhotos(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '20',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  /* Http Parsing */
  static SearchPhotosRes parseSearchPhotos(String response) {
    dynamic json = jsonDecode(response);
    return SearchPhotosRes.fromJson(json);
  }

  static List<Collection> parseCollections(String response) {
    dynamic json = jsonDecode(response);
    return List<Collection>.from(json.map((x) => Collection.fromJson(x)));
  }

  static List<Photo> parseCollectionsPhotos(String response) {
    dynamic json = jsonDecode(response);
    return List<Photo>.from(
        json.map((x) => Photo.fromJson(x)));
  }
}