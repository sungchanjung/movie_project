import 'package:flutter/material.dart';
import 'package:movie_project/presentation/archived/movie_archived_screen.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/movie_data_source.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../main.dart';
import '../archived/movie_archived_view_model.dart';

class MovieMainScreen extends StatefulWidget {
  const MovieMainScreen({super.key});

  @override
  State<MovieMainScreen> createState() => _MovieMainScreenState();
}

class _MovieMainScreenState extends State<MovieMainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<MovieMainViewModel>().showMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieMainViewModel>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              heroTag: '넘기기',
              onPressed: () {
                viewModel.onPass();
              },
              child: Icon(Icons.thumb_down, color: Colors.white,),
            ),
            FloatingActionButton(
              backgroundColor: Colors.black,
              heroTag: '좋아요',
              onPressed: () {
                viewModel.onLikes(viewModel.movieList[viewModel.index]);
              },
              child: Icon(Icons.thumb_up, color: Colors.white,),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('영화목록', style: TextStyle(color: Colors.black, fontSize: 20),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => MovieArchivedViewModel(
                      movieRepository: MovieRepositoryImpl(
                        api: MovieDataSource(),
                        archived: archived,
                      ),
                    ),
                    child: MovieArchivedScreen(),
                  ),
                ),
              );
            },
            icon: Icon(Icons.list_alt, color: Colors.black,),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
            child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 590,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${viewModel.movieList[viewModel.index].posterPath}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4,),
                        Text(
                          viewModel.movieList[viewModel.index].title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.star, size: 18, color: Color(0xFFFFB800),),
                            SizedBox(width: 4,),
                            Text(((viewModel.movieList[viewModel.index].voteAverage * 10).round() / 10).toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        SizedBox(height: 4,),
                        Text(viewModel.movieList[viewModel.index].overview),
                      ],
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
