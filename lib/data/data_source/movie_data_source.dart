import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/movie_dto.dart';

class MovieDataSource {
  final _baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=";
  final _apiKey = '84903395cbf9b0e42926167ee3526acb';

  Future<List<Results>> getMovie() async {
    final response =
        await http.get(Uri.parse('$_baseUrl$_apiKey&language=ko-KR'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];
      return results.map((json) => Results.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
