import 'package:flutter/material.dart';
import 'package:project_showcase/pages/detail/componets/actor_item.dart';
import 'package:project_showcase/config/size_config.dart';

import '../../../models/actor.dart';

class Cast extends StatelessWidget {
  final List<Actor> cast;

  const Cast({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Actors",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18),
        ),
        SizedBox(height: SizeConfig.defaultHeight,),
        Row(
          children: [
            ...cast.map((actor) => ActorItem(actor: actor)
            ),
          ],
        )
      ],
    );
  }
}
