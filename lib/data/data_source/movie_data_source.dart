import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_project/core/config/themoviedb_config.dart';

import '../dto/movie_dto.dart';

class MovieDataSource {
  Future<List<ResultsDto>> getMovie() async {
    final response = await http.get(Uri.parse(
        '${TheMovieDbConfig.baseUrl}/3/movie/popular?api_key=${TheMovieDbConfig.apiKey}&language=ko-KR'));

    if (response.statusCode != 200) {
      throw Exception('Error');
    }
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> results = jsonData['results'];
    return results.map((json) => ResultsDto.fromJson(json)).toList();
  }
}
