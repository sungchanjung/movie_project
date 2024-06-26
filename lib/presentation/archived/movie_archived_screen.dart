import 'package:flutter/material.dart';
import 'package:movie_project/presentation/archived/movie_archived_view_model.dart';
import 'package:provider/provider.dart';

class MovieArchivedScreen extends StatelessWidget {
  const MovieArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieArchivedViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 보관함'),
      ),
      body: ListView(
        children: viewModel.archived.likeList.map((e) {
          return Container(
            margin: EdgeInsets.only(
                top: e == viewModel.archived.likeList.first ? 16 : 0,
                left: 0,
                right: 0,
                bottom: e == viewModel.archived.likeList.last ? 16 : 0),
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16.0, right: 16.0, bottom: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${e.posterPath}",
                      width: 144,
                      height: 144,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFB800),
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  ((e.voteAverage * 10).round() / 10)
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: IconButton(
                                onPressed: () {
                                  viewModel.onDelete(e.id);
                                },
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          e.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Text(
                            e.overview,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
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
    );
  }
}
