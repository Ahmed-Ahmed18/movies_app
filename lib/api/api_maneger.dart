import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_constants.dart';
import 'package:movie_app/model/details.dart';
import 'package:movie_app/model/top_rated.dart';
import 'package:movie_app/model/upcoming.dart';

import '../model/popular.dart';

class ApiManeger{
  static Future<PopularResponse?> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.baseurl,ApiConstants.popuralapi);
    var popularresponse = await http.get(url,headers: {
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzBkYjZkYmFhNGM2NzIzMTA1MGEzYjJlNWY4YzVjNSIsIm5iZiI6MTcyNjAzNzY4OC41MDAxNTYsInN1YiI6IjY2ZTA1ZWQzMDAwMDAwMDAwMDU4OGNhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fmf0F6FkLB61Q6V_lxXxzWNA2Om9kj0CqKkdO9QBZd4'
    });
    print('getting data sucssesfuly');
    try {

      var popularres= PopularResponse.fromJson(jsonDecode(popularresponse.body));
      print(' converted successfully');
      return popularres;

    }catch (e) {
      throw e;
    }

  }

  static Future<UpcomingResponse?> getUpcomingMovies() async {
    Uri url = Uri.https(ApiConstants.baseurl,ApiConstants.upcomingapi);
    var upcomingresponse = await http.get(url,headers: {
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzBkYjZkYmFhNGM2NzIzMTA1MGEzYjJlNWY4YzVjNSIsIm5iZiI6MTcyNjE1MDE3OC40MDY0ODgsInN1YiI6IjY2ZTA1ZWQzMDAwMDAwMDAwMDU4OGNhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xvn2m-dXcQD1IzDjd9vCoMfnmGKkgeK-6t9nWYk4T7A'
    });
    print('getting data sucssesfuly');
    try {
      var ubcomingres= UpcomingResponse.fromJson(jsonDecode(upcomingresponse.body));
      print(' converted successfully');
      return ubcomingres;
    }catch (e) {
      throw e;
    }

  }

  static Future<TopRatedResponse?> getTopRatedMovies() async {
    Uri url = Uri.https(ApiConstants.baseurl,ApiConstants.topratedapi);
    var topratedresponse = await http.get(url,headers: {
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzBkYjZkYmFhNGM2NzIzMTA1MGEzYjJlNWY4YzVjNSIsIm5iZiI6MTcyNjIyODI2NC40ODkzMjcsInN1YiI6IjY2ZTA1ZWQzMDAwMDAwMDAwMDU4OGNhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dDA55JwauZM58AgQvt93tZxuEEOVc6YpI4QipFIO3uY'
    });
    print('getting data sucssesfuly');
    try {
      var topratedres= TopRatedResponse.fromJson(jsonDecode(topratedresponse.body));
      print(' converted successfully');
      return topratedres;
    }catch (e) {
      throw e;
    }
  }

  static Future<DetailsResponse?> getMovieDetails(int movieId) async {
    Uri url = Uri.https(ApiConstants.baseurl,ApiConstants.detailsapi);
    var detailsresponse = await http.get(url,headers: {
      'Authorization':' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzBkYjZkYmFhNGM2NzIzMTA1MGEzYjJlNWY4YzVjNSIsIm5iZiI6MTcyNjE1MDE3OC40MDY0ODgsInN1YiI6IjY2ZTA1ZWQzMDAwMDAwMDAwMDU4OGNhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xvn2m-dXcQD1IzDjd9vCoMfnmGKkgeK-6t9nWYk4T7A'
    });
    print('getting data sucssesfuly');
    try {
      var detailsres= DetailsResponse.fromJson(jsonDecode(detailsresponse.body));
      print(' converted successfully');
      return detailsres;
    }catch (e) {
      throw e;
    }
  }
}