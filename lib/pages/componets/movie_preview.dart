import 'package:flutter/material.dart';
import 'package:project_showcase/components/back_container.dart';

import '../../components/movies/mvie_header.dart';
import '../../models/movie.dart';
import '../../size_config.dart';

class MoviePreview extends StatelessWidget {

  final int index;

  const MoviePreview({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: BackContainer(child:
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                SizeConfig.defaultHeight * 3),
            child: Container(
              height: SizeConfig.defaultHeight * 40,
              width: double.infinity,
              child: Image.asset(
                movies[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: SizeConfig.defaultHeight,),
          MovieHeader(movie: movies[index],
            ),
        ],
      ),
      ),
    );
  }
}
