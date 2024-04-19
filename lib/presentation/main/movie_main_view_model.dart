import 'package:flutter/material.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieMainViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieMainViewModel({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  List<Movie> _movieList = [];
  List<Movie> get movieList => List.unmodifiable(_movieList);

  List<Movie> _likeList = [];
  List<Movie> get likeList => List.unmodifiable(_likeList);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void showMovie() async {
    final data = await _movieRepository.getMovieList();
    _movieList = data;
    notifyListeners();
  }

  void onLikes(Movie movie) async {
    // _likeList = 현재 인덱스 무비를 담는다
    // 다음게 나온다
  }

  void onPass() async {}
}
