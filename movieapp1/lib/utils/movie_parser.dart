import 'dart:convert';

import 'package:movieapp1/model/moviemodel.dart';

class MovieParser {
  static List<MovieModel> parseMovies(String jsonString) {
    final List<dynamic> parsedJSONList = json.decode(jsonString);
    return parsedJSONList
        .map((jsonItem) => MovieModel.fromJson(jsonItem))
        .toList();
  }
}
