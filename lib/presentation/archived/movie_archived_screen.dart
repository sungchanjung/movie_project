import 'package:flutter/material.dart';
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
              width: double.infinity,
              height: 600,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: archived.likeList.map((e) {
                  return Container(
                    height: 120,
                    color: Colors.amber[600],
                    child: Row(
                      children: [
                        Image.network('https://helpx.adobe.com/content/dam/help/en/photoshop/using/quick-actions/remove-background-before-qa1.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('별점'),
                                Text('자세히 보기'),
                              ],
                            ),
                            Text('제목'),
                            Text('내용'),
                          ],
                        ),
                      ],
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