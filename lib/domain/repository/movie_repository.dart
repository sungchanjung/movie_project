import '../model/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> getMovieList(int page);

  Future<List<Movie>> getLikeList();

  Future<void> saveLikeList(List<Movie> onSaveList);

  Future<void> deleteLikeList(List<Movie> onDeleteList);
}

