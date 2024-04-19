import 'package:flutter/material.dart';

class MovieMainScreen extends StatelessWidget {
  const MovieMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Text('넘길래요'),
          ),
          FloatingActionButton(
            onPressed: () {},
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 590,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/1ZNOOMmILNUzVYbzG1j7GYb5bEV.jpg",
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.star),
                Text('평점'),
                Text(
                  '내용',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
