import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/di/di_setup.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieArchivedViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;
  final Archived archived;

  MovieArchivedViewModel({
    required this.archived,
    required MovieRepository movieRepository,

  }) : _movieRepository = movieRepository;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void showLoading() async {
    _isLoading = true;
    notifyListeners();

    _isLoading = archived.likeList.isEmpty ? true : false;
    notifyListeners();
  }

  void onDelete(int deleteId) async {
    archived.likeList.removeWhere((element) => element.id == deleteId);
    await _movieRepository.deleteLikeList(archived.likeList);
    notifyListeners();
  }
}
