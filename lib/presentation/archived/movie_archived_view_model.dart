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

  bool isLoading = true;

  MovieRepository get movieRepository => _movieRepository;

  void showLoading() async {
    isLoading = true;
    notifyListeners();

    isLoading = getIt<Archived>().likeList.isEmpty ? true : false;
    notifyListeners();
  }

  void onDelete(int deleteId) async {
    getIt<Archived>().likeList.removeWhere((element) => element.id == deleteId);
    await getIt<Box<String>>()
        .put('likeList', jsonEncode(getIt<Archived>().likeList));
    notifyListeners();
  }
}
