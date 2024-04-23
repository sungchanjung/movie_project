import 'package:get_it/get_it.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/repository/movie_repository_impl.dart';
import 'package:movie_project/domain/repository/movie_repository.dart';
import 'package:movie_project/presentation/archived/movie_archived_view_model.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';

final getIt = GetIt.instance;
void diSetup() {
  getIt.registerSingleton<Archived>(Archived([]));
  getIt.registerSingleton<MovieDataSource>(MovieDataSource());
  getIt.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(api: getIt(), archived: getIt()));
  getIt.registerFactory(() => MovieMainViewModel(movieRepository: getIt()));
  getIt.registerFactory(() => MovieArchivedViewModel(movieRepository: getIt()));
}
