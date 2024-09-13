import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/api/api_maneger.dart';
import 'package:movie_app/model/top_rated.dart';
import 'package:movie_app/model/upcoming.dart';
import 'package:movie_app/movies/popular_movies_item.dart';
import 'package:movie_app/movies/top_rated_movies_item.dart';
import 'package:movie_app/movies/upcoming_movies_item.dart';

import '../core/app_colors.dart';
import '../model/popular.dart';

class MoviesBuilder extends StatefulWidget {
  const MoviesBuilder({super.key});

static const String routename='movies';
  @override
  State<MoviesBuilder> createState() => _MoviesBuilderState();
}
class _MoviesBuilderState extends State<MoviesBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<PopularResponse?>(
            future: ApiManeger.getPopularMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primarycolor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(
                      'Something Went Wrong',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.blackcolor, fontSize: 16),
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              ApiManeger.getPopularMovies();
                              setState(() {});
                            },
                            child: Text('Try Again')))
                  ],
                );
              }
              log(snapshot.data.toString());
              var popularlist=snapshot.data!.results!;
              return PopularMoviesWidget(popular: popularlist);
            }),

       SizedBox(height: 25,),

        FutureBuilder<UpcomingResponse?>(
    future: ApiManeger.getUpcomingMovies(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
    child: CircularProgressIndicator(
    color: AppColor.primarycolor,
    ),
    );
    } else if (snapshot.hasError) {
    return Column(
    children: [
    Text(
    'Something Went Wrong',
    style: Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: AppColor.blackcolor, fontSize: 16),
    ),
    Center(
    child: ElevatedButton(
    onPressed: () {
    ApiManeger.getUpcomingMovies();
    setState(() {});
    },
    child: Text('Try Again')))
    ],
    );
    }
    log(snapshot.data.toString());
    var upcominglist=snapshot.data!.results!;

    return Expanded(child: UpcomingMoviesItem(upcomingmovies: upcominglist));
    }),

        SizedBox(height: 25,),

        FutureBuilder<TopRatedResponse?>(
            future: ApiManeger.getTopRatedMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primarycolor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(
                      'Something Went Wrong',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.blackcolor, fontSize: 16),
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              ApiManeger.getTopRatedMovies();
                              setState(() {});
                            },
                            child: Text('Try Again')))
                  ],
                );
              }
              log(snapshot.data.toString());
              var topratedlist=snapshot.data!.results!;
              return TopRatedMoviesItem(topratedmovies: topratedlist) ;
            }),
      ],
    );


  }
}
