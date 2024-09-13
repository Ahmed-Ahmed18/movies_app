import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/model/popular.dart';
import 'package:movie_app/model/upcoming.dart';
import 'package:movie_app/movies/movie_item.dart';


class UpcomingMoviesItem extends StatefulWidget {


List<UpcomingResults>upcomingmovies;

UpcomingMoviesItem({required this.upcomingmovies});

  @override
  State<UpcomingMoviesItem> createState() => _UpcomingMoviesItemState();
}

class _UpcomingMoviesItemState extends State<UpcomingMoviesItem> {

  //https://image.tmdb.org/t/p/w500
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: AppColor.containecolor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('New Releases',
                    style: TextStyle(
                    color: AppColor.whitecolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
        
                  ),),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(itemBuilder:(context,index)=>MovieItem(imagepath:widget.upcomingmovies[index].posterPath! ),
                itemCount:widget.upcomingmovies.length ,
                scrollDirection: Axis.horizontal,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
