import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/top_rated.dart';

import '../core/app_colors.dart';
import 'movie_item.dart';

class TopRatedMoviesItem extends StatefulWidget {
  List<TopRatedResults>topratedmovies;

   TopRatedMoviesItem({required this.topratedmovies});

  @override
  State<TopRatedMoviesItem> createState() => _TopRatedMoviesItemState();
}

class _TopRatedMoviesItemState extends State<TopRatedMoviesItem> {
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
                  child: Text('Recomended',
                    style: TextStyle(
                      color: AppColor.whitecolor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
        
                    ),),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(itemBuilder:(context,index)=>MovieItem(imagepath:widget.topratedmovies[index].posterPath! ),
                  itemCount:widget.topratedmovies.length ,
                  scrollDirection: Axis.horizontal,),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
