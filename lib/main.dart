import 'package:flutter/material.dart';
import 'package:movie_project/core/data_source/archived.dart';
import 'package:movie_project/data/data_source/movie_data_source.dart';
import 'package:movie_project/data/repository/movie_repository_impl.dart';
import 'package:movie_project/presentation/archived/movie_archived_screen.dart';
import 'package:movie_project/presentation/main/movie_main_screen.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';
import 'package:provider/provider.dart';

final Archived archived = Archived([]);

void main() {
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
