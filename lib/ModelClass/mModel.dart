// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

class GetMoviesModel {
  int id;
  String movie;
  double rating;
  String image;
  String imdbUrl;

  GetMoviesModel({
    required this.id,
    required this.movie,
    required this.rating,
    required this.image,
    required this.imdbUrl,
  });

  factory GetMoviesModel.fromMap(Map<String, dynamic> map) => GetMoviesModel(
    id: map["id"],
    movie: map["movie"],
    rating: map["rating"].toDouble(),
    image: map["image"],
    imdbUrl: map["imdb_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "movie": movie,
    "rating": rating,
    "image": image,
    "imdb_url": imdbUrl,
  };
}
