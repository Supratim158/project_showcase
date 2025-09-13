import 'package:flutter/material.dart';
import 'package:project_showcase/components/movies/mvies_genres.dart';
import 'package:project_showcase/models/movie.dart';

import '../../config/size_config.dart';
import 'mvies_rate.dart';

class MovieHeader extends StatelessWidget {

  final Movie movie;

  const MovieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
