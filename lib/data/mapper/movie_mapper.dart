import 'package:movie_project/data/dto/movie_dto.dart';
import 'package:movie_project/domain/model/movie.dart';

extension ToMovie on Results {
  Movie toMovie() {
    return Movie(id: id!.toInt(),
        title: title ?? '',
        overview: overview ?? '',
        posterPath: posterPath ?? '',
        voteAverage: voteAverage ?? 0,
        genreIds: genreIds ?? []);
  }
}