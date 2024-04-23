import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/mapper/movie_mapper.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _api;

  const MovieRepositoryImpl({
    required MovieDataSource api,
  })  : _api = api;

  @override
  Future<List<Movie>> getMovieList(int page) async {
    final data = await _api.getMovie(page);
    return data.map((e) => e.toMovie()).toList();
  }

  @override
  Future<void> deleteLikeList(List<Movie> onDeleteList) async {

      await  Hive.box<String>('archivedList.db')
          .put('likeList', jsonEncode(onDeleteList));
  }

  @override
  Future<List<Movie>> getLikeList() async {
    String? likeLists = Hive.box<String>('archivedList.db').get('likeList') ?? '[]';

    return (jsonDecode(likeLists.toString()) as List<dynamic>)
            .map((e) => Movie.fromJson(e))
            .toList();
  }

  @override
  Future<void> saveLikeList(List<Movie> onSaveList) async {
    await Hive.box<String>('archivedList.db').put('likeList', jsonEncode(onSaveList));
  }
}