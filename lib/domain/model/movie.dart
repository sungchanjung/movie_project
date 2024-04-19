import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required num voteAverage,
    required List genreIds,
    
  }) = _Movie;
  
  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json); 
}