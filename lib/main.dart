import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/repository/movie_repository_impl.dart';
import 'package:movie_project/domain/model/movie.dart';
import 'package:movie_project/presentation/archived/movie_archived_screen.dart';
import 'package:movie_project/presentation/main/movie_main_screen.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';
import 'package:provider/provider.dart';

final Archived archived = Archived([]);
late final Box<String> archivedList;

Future<void> main() async {
  await Hive.initFlutter();

  archivedList = await Hive.openBox<String>('archivedList.db');

  await dotenv.load(fileName: "assets/config/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (_) => MovieMainViewModel(
                movieRepository: MovieRepositoryImpl(
                    api: MovieDataSource(), archived: archived),
              ),
          child: MovieMainScreen()),
    );
  }
}
