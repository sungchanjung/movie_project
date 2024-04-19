import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_project/main.dart';
import 'package:movie_project/presentation/archived/movie_archived_view_model.dart';
import 'package:provider/provider.dart';

class MovieArchivedScreen extends StatefulWidget {
  const MovieArchivedScreen({super.key});

  @override
  State<MovieArchivedScreen> createState() => _MovieArchivedScreenState();
}

class _MovieArchivedScreenState extends State<MovieArchivedScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieArchivedViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('나의 보관함'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: archived.likeList.map((e) {
                  return Container(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8),
                      child: Row(
                        children: [
                          Image.network(
                            "https://image.tmdb.org/t/p/w500/${e.posterPath}",
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(((e.voteAverage * 10).round() / 10).toString()),
                                    Text('자세히 보기'),
                                  ],
                                ),
                                Text(e.title),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Text(
                                    e.overview,
                                    overflow: TextOverflow.ellipsis,maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
