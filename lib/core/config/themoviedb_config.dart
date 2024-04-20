import 'package:flutter_dotenv/flutter_dotenv.dart';

class TheMovieDbConfig{
  static final String baseUrl = dotenv.env['THEMOVIEDB_BASE_URL'].toString();
  static final String apiKey = dotenv.env['THEMOVIEDB_API_KEY'].toString();
  static final String imageUrl = dotenv.env['THEIMAGE_URL'].toString();

}