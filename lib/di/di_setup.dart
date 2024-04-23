import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/repository/movie_repository_impl.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';
import 'package:movie_project/presentation/archived/movie_archived_view_model.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';

final getIt = GetIt.instance;
Future<void> diSetup() async {
  getIt.registerSingleton<Archived>(Archived([]));

  var hiveBox = await Hive.openBox<String>('archivedList.db');
  getIt.registerSingleton<Box<String>>(hiveBox);

  getIt.registerSingleton<MovieDataSource>(MovieDataSource());
  getIt.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(api: getIt(), archived: getIt()));

  getIt.registerFactory(() => MovieMainViewModel(movieRepository: getIt()));
  getIt.registerFactory(() => MovieArchivedViewModel(movieRepository: getIt()));
}
