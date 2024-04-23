import 'package:go_router/go_router.dart';
import 'package:movie_project/di/di_setup.dart';
import 'package:movie_project/presentation/archived/movie_archived_screen.dart';
import 'package:movie_project/presentation/archived/movie_archived_view_model.dart';
import 'package:movie_project/presentation/main/movie_main_screen.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => getIt<MovieMainViewModel>(),
        child: const MovieMainScreen(),
      );
    },
  ),
  GoRoute(
    path: '/archived',
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => getIt<MovieArchivedViewModel>(),
        child: const MovieArchivedScreen(),
      );
    },
  ),
]);
