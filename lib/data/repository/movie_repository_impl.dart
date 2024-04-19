import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/mapper/movie_mapper.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _api;

  const MovieRepositoryImpl({
    required MovieDataSource api,
  }) : _api = api;

  @override
  Future<List<Movie>> getMovieList() async {
    final data = await _api.getMovie();
    return data.map((e) => e.toMovie()).toList();
  }
}
