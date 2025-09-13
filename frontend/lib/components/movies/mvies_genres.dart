import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({super.key, this.genres});

  final List<String>? genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...genres!.map((genres) => Container(

          margin: EdgeInsets.only(left:SizeConfig.defaultWidth),
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultWidth, vertical: SizeConfig.defaultHeight/2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(SizeConfig.defaultWidth*2)
          ),
          child: Text(
            genres,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ),
        ),
      ],
    );
  }
}
