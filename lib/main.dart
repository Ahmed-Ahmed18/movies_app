import 'package:flutter/material.dart';
import 'package:movie_app/cagtegory/category_screen.dart';
import 'package:movie_app/core/app_them.dart';
import 'package:movie_app/home/home.dart';

import 'package:movie_app/movies/movies_builder.dart';
import 'package:movie_app/movies/popular_movies_item.dart';
import 'package:movie_app/search/search_screen.dart';
import 'package:movie_app/watch_list/watch_list_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MoviesBuilder.routename: (context) => MoviesBuilder(),
        SearchScreen.routename:(context)=>SearchScreen(),
        CategoryScreen.routename:(context)=>CategoryScreen(),
        WatchListScreen.routename:(context)=>WatchListScreen(),
      },
      theme: ApplicationThem.mythem,

    );
  }
}
