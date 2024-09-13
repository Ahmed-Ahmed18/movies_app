import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/cagtegory/category_screen.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/movies/movies_builder.dart';
import 'package:movie_app/movies/popular_movies_item.dart';
import 'package:movie_app/search/search_screen.dart';
import 'package:movie_app/watch_list/watch_list_screen.dart';

import '../model/popular.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const String routeName = 'homescreen';
List<Results>?pop;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarycolor,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).canvasColor),
        child: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Home icon.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon:
                ImageIcon(AssetImage('assets/images/search-2.png')),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon material-movie.png')),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Icon ionic-md-bookmarks.png')),
                label: 'WatchList'),

          ],
        ),
      ),
      body: tabs[selectedindex],
    );
  }
  List<Widget> tabs = [
    MoviesBuilder(),
    SearchScreen(),
    CategoryScreen(),
    WatchListScreen(),
  ];
}
