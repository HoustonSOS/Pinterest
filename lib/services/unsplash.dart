import 'dart:convert';
import 'dart:io';
import 'package:database/models/unsplash_photo.dart';
import 'package:http/http.dart';

class UnsplashAPI{
  static const API_LOCATION = "api.unsplash.com";
  static const GET_RANDOM = "/photos/random/";
  static const GET_LIST = "/photos/";
  static const Map<String, String> headers = {
    "Content-type" : "application/json",
    "Authorization" : "Client-ID 5QYrvyz15mVZW2YyaM68-f5hdrRH1giGTExBmG_oweM"
  };

  static Future<Unsplash> getRandomThumbnail() async {
    var uri = Uri.https(API_LOCATION, GET_RANDOM);

    var response = await get(uri, headers: headers);

    switch(response.statusCode){
      case 200:
        return Unsplash.fromJson(jsonDecode(response.body));
      case 400:
        throw const HttpException("The request was unacceptable, often due to missing a required parameter");
      case 401:
        throw const HttpException("Invalid Access Token");
      case 403:
        throw const HttpException("Missing permissions to perform request");
      case 404:
        throw const HttpException("The requested resource doesn’t exist");
      default:
        throw const HttpException("Something went wrong");
    }
  }
}