import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/mapper/movie_mapper.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _api;
  final Archived _archived;

  const MovieRepositoryImpl({
    required MovieDataSource api,
    required Archived archived,
  })  : _api = api,
        _archived = archived;

  @override
  Future<List<Movie>> getMovieList(int page) async {
    final data = await _api.getMovie(page);
    return data.map((e) => e.toMovie()).toList();
  }
}
