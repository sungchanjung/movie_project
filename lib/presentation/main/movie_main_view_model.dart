import 'package:flutter/material.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';
import 'package:movie_project/main.dart';

class MovieMainViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieMainViewModel({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  List<Movie> _movieList = [];

  List<Movie> get movieList => List.unmodifiable(_movieList);

  // List<Movie> _likeList = [];
  //
  // List<Movie> get likeList => List.unmodifiable(_likeList);

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  int _index = 0;

  int get index => _index;

  void showMovie() async {
    _isLoading = true;
    notifyListeners();

    final data = await _movieRepository.getMovieList();
    _movieList = data;
    _isLoading = false;
    notifyListeners();
  }

  void onLikes(Movie movie) async {
    archived.likeList.add(movie);
    print(archived.likeList);
    _index++;
    notifyListeners();
  }

  void onPass() async {
    _index++;
    notifyListeners();
  }
}
