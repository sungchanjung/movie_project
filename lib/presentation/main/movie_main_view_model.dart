import 'package:flutter/material.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/di/di_setup.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieMainViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;
  final Archived archived;

  MovieMainViewModel({
    required MovieRepository movieRepository,
    required this.archived,
  }) : _movieRepository = movieRepository;

  List<Movie> _movieList = [];

  List<Movie> get movieList => List.unmodifiable(_movieList);

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool _isEnd = false;

  bool get isEnd => _isEnd;
  int _page = 1;

  int get page => _page;

  int _index = 0;

  int get index => _index;

  Future<void> showMovie() async {
    _isLoading = true;
    notifyListeners();

    final data = await _movieRepository.getMovieList(_page);

    _movieList = data
        .where((element) =>
            !getIt<Archived>().likeList.any((movie) => movie.id == element.id))
        .toList();

    _isLoading = false;
    notifyListeners();
  }

  void onLikes(Movie movie) async {
    if (_index < _movieList.length - 1) {
      archived.likeList.add(movie);
      await _movieRepository.saveLikeList(archived.likeList);
      _index++;
      notifyListeners();
    } else if (_index <= _movieList.length - 1) {
      archived.likeList.add(movie);
      await _movieRepository.saveLikeList(archived.likeList);
      _page++;
      _index = 0;
      await showMovie();
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
    } else if (_index == _movieList.length - 1) {
      _page++;
      _index = 0;
      await showMovie();
      notifyListeners();
    } else {
      _isEnd = true;
      notifyListeners();
    }
  }

  void getArchived() async {
    archived.likeList = await _movieRepository.getLikeList();
    notifyListeners();
  }
}
