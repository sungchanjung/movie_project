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

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isEnd = false;
  bool get isEnd => _isEnd;

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
    if (_index < _movieList.length - 1) {
      archived.likeList.add(movie);
      _index++;
      notifyListeners();
    } else {
      _isEnd = true;
      notifyListeners();
    }
  }

  void onPass() async {
    if (_index < _movieList.length - 1) {
      _index++;
      notifyListeners();
    } else {
      _isEnd = true;
      notifyListeners();
    }
  }
}
