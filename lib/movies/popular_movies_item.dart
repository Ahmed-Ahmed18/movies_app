
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/model/popular.dart';
import 'package:movie_app/model/upcoming.dart';
import 'package:movie_app/movies/upcoming_movies_item.dart';

class PopularMoviesWidget extends StatefulWidget {
  List<Results> popular;

   PopularMoviesWidget({required this.popular,});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {

  //https://image.tmdb.org/t/p/w500

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          CarouselSlider(
            options:CarouselOptions(
              height: 300,
              aspectRatio: 16/9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )
            ,items:widget.popular.map((pop) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 25,

                    ),
                    child:
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500${pop.posterPath}'
                                  ),fit: BoxFit.fill)
                              ),
                            ),
                            Center(
                              child: IconButton(onPressed:(){
                              }, icon:Icon(Icons.play_circle_fill,size: 80,
                              )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: LinearGradient(colors: [
                                    Colors.black.withOpacity(.3),
                                    Colors.black54.withOpacity(.4)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                 Container(
                                   margin: EdgeInsets.only(left: 10)
                                   ,width: MediaQuery.of(context).size.width,
                                   padding: EdgeInsets.only(
                                     bottom: 8,
                                     left: 8
                                   ),
                                   child:  Text(pop.title??'',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                       color: AppColor.whitecolor
                                       ,fontSize: 14
                                       ,fontWeight: FontWeight.w700,
                                   ),),
                                 ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10)
                                    ,width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        bottom: 8,
                                        left: 8
                                    ),
                                    child:  Text('Release Date: ${pop.releaseDate}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColor.greycolor
                                      ,fontSize: 10
                                      ,fontWeight: FontWeight.w800,
                                    ),),
                                  )
                                ],
                              ),
                            )
                          ]
                        ),
                    );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
