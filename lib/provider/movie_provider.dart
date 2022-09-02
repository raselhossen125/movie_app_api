import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:movie_app_api/model/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  MovieModel? movieModel;

  getMovieData() async {
    final uri = Uri.parse(
        'https://yts.mx/api/v2/list_movies.json');
    try {
      final response = await get(uri);
      final map = json.decode(response.body);
      if (response.statusCode == 200) {
        movieModel = MovieModel.fromJson(map);
        notifyListeners();
      } else {
        print('else block exicute');
      }
    } catch (error) {
      print('Error $error');
    }
  }
}