import 'package:flutter/cupertino.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';
import 'package:movie_project/main.dart';

class MovieArchivedViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieArchivedViewModel({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  bool isLoading = true;

  MovieRepository get movieRepository => _movieRepository;

  void showLoading() async {
    isLoading = true;
    notifyListeners();

    isLoading = archived.likeList.isEmpty ? true : false;
    notifyListeners();
  }

  void onDelete(int deleteId) async {
    archived.likeList.removeWhere((element) => element.id == deleteId);
    notifyListeners();
  }
}
