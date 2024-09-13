import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  String imagepath;
   MovieItem({required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 100,
          child: Stack(
            children: [
              Image.network('https://image.tmdb.org/t/p/w500$imagepath'),
              InkWell(
                onTap: (){},
                  child: Image(image: AssetImage('assets/images/bookmark.png')))
            ],
          ),
        ),
      ),
    );
  }
}
