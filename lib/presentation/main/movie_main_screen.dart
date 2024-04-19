import 'package:flutter/material.dart';
import 'package:movie_project/presentation/main/movie_main_view_model.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              viewModel.onPass();
            },
            child: Text('넘길래요'),
          ),
          FloatingActionButton(
            onPressed: () {
              viewModel.onLikes(viewModel.movieList[viewModel.index]);
            },
            child: Text('좋아요'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('영화목록'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? CircularProgressIndicator()
          : Column(
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
                      Text(
                        '쿵푸팬더',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Icon(Icons.star),
                      Text('평점'),
                      Text(
                        '내용',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text('팬더가 블라블ㄹ라블라'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}