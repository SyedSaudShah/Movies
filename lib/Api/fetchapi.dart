import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/ModelClass/mModel.dart';
abstract
class GetMoviesApi{
  String baseUrl = 'https://dummyapi.online/api';
  String get  endpoint;
  String get url =>baseUrl + endpoint;

  dynamic fetch()async{
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return  jsonDecode(response.body);
    }  else{
      return response.statusCode;
    }
  }
}
class FetchApi extends GetMoviesApi{
  static FetchApi? fetchApi;
  FetchApi._internal();
  factory FetchApi(){
    return fetchApi ??= FetchApi._internal();
  }
  Future<List<GetMoviesModel>>fetchPost()async{
    var post = await fetch() as List;
    var data = post.map((e) => GetMoviesModel.fromMap(e)).toList();
    // var data = post.map((e) => GetMoviesModel(id: 1, movie: 'movie', rating: 1, image: 'image', imdbUrl: 'imdbUrl'));
  return data;
  }
  @override

  String get endpoint => '/movies';
}