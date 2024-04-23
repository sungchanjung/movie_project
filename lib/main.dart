import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_project/core/router/router.dart';
import 'package:movie_project/di/di_setup.dart';

//final Archived archived = Archived([]);
late final Box<String> archivedList;

Future<void> main() async {
  await Hive.initFlutter();

  archivedList = await Hive.openBox<String>('archivedList.db');

  await dotenv.load(fileName: "assets/config/.env");

  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Movie Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}
