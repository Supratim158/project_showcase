import 'package:flutter/material.dart';
import 'package:project_showcase/animations/staggered_translate_animation.dart';
import 'package:project_showcase/models/movie.dart';
import 'package:project_showcase/config/size_config.dart';

class HeaderCard extends StatelessWidget {
  final int indexMovie;

  const HeaderCard({super.key, required this.indexMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(indexMovie - 1>=0)
        Positioned(
            left: 0,
            top: SizeConfig.defaultHeight*7,
            child: StaggeredTranslateAnimation(
              delay: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.defaultHeight * 3),
                child: Container(
                  width: SizeConfig.screenWidth / 2,
                  child: Image.asset(
                    movies[indexMovie-1].imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
        if(indexMovie + 1<=movies.length-1)
        Positioned(
            right: 0,
            top: SizeConfig.defaultHeight*7,
            child: StaggeredTranslateAnimation(
              translateX: 200,
              delay: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.defaultHeight * 3),
                child: Container(
                  width: SizeConfig.screenWidth / 2,
                  child: Image.asset(
                    movies[indexMovie+1].imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
        Positioned(
            left: SizeConfig.screenWidth / 4,
            child: StaggeredTranslateAnimation(
              translateX: 0,
              translateY: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.defaultHeight * 3),
                child: Container(
                  width: SizeConfig.screenWidth / 2,
                  child: Image.asset(
                    movies[indexMovie].imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
