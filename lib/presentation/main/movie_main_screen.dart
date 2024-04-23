import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      final viewModel = context.read<MovieMainViewModel>();
      viewModel.showMovie();
      viewModel.getArchived();
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
              child: const Icon(
                Icons.thumb_down,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.black,
              heroTag: '좋아요',
              onPressed: () {
                viewModel.onLikes(viewModel.movieList[viewModel.index]);
                // viewModel.onTest(viewModel.movieList[viewModel.index]);
              },
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          '영화목록',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/archived'),
            icon: const Icon(
              Icons.list_alt,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const CircularProgressIndicator()
          : viewModel.isEnd == true
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '😮🥺🤯🤨',
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '영화 정보가 더 이상 존재하지 않습니다.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 590,
                        child: Image.network(
                            fit: BoxFit.fill,
                            "https://image.tmdb.org/t/p/w500/${viewModel.movieList[viewModel.index].posterPath}",
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        }),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              viewModel.movieList[viewModel.index].title,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xFFFFB800),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  ((viewModel.movieList[viewModel.index]
                                                      .voteAverage *
                                                  10)
                                              .round() /
                                          10)
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(viewModel.movieList[viewModel.index].overview),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
    );
  }
}
