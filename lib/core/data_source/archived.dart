import 'package:hive/hive.dart';
import 'package:movie_project/domain/model/movie.dart';

part 'archived.g.dart';

@HiveType(typeId: 0)
class Archived extends HiveObject {

  @HiveField(0)
  List<Movie> likeList = [];

  Archived(
    this.likeList,
  );
}

