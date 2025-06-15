import 'package:flutter/material.dart';
import 'package:project_showcase/components/movies/mvies_genres.dart';
import 'package:project_showcase/models/movie.dart';

import '../../size_config.dart';
import 'mvies_rate.dart';

class MovieHeader extends StatelessWidget {

  final Movie movie;

  const MovieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ClipRRect(
        borderRadius: BorderRadius.circular(
            SizeConfig.defaultHeight * 3),
        child: Container(
          height: SizeConfig.defaultHeight * 40,
          width: double.infinity,
          child: Image.asset(
            movie.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
        SizedBox(height: SizeConfig.defaultHeight,),
        Text(movie.name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),),
        SizedBox(height: SizeConfig.defaultHeight,),
        MovieGenres(genres: movie.genres),
        SizedBox(height: SizeConfig.defaultHeight),
        MovieRate(
          rate: movie.rate,
        )
      ],
    );
  }
}
