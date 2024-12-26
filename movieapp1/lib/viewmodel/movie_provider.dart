import 'package:flutter/material.dart';
import 'package:movieapp1/model/moviemodel.dart';
import 'package:movieapp1/utils/movie_parser.dart';
import 'package:provider/provider.dart';

class MovieProvider extends ChangeNotifier {
  List<MovieModel> _moviesList = [];
  List<MovieModel> get moviesList => _moviesList;
  Future<void> loadMovies(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(context).loadString('assets/data/movies.json');
      final movies = MovieParser.parseMovies(jsonString);
      _moviesList = movies;
      notifyListeners();
    } catch (e) {
      print('Error in loading movies : $e');
    }
  }
}
// List<MovieModel> _moviesList = [
//   // 'Harry Potter',
//   // 'The Lord of the Rings',
//   // 'The Avengers',
//   // 'The Lion King',
//   // 'Spiderman',
// ];
// List<MovieModel> get moviesList => _moviesList;
// // List<String> loadMovies() {
// //   return _moviesList;
// // }

// Future<void> loadMovies(BuildContext context) async {
//   try {
//     final jsonString = await DefaultAssetBundle.of(context)
//         .loadString('assets/data/movies.json');
//     final movies = MovieParser.parseMovies(jsonString);
//     _moviesList = movies;
//     notifyListeners();
//   } catch (e) {
//     print('Error in loading movies : $e');
//   }
// }
