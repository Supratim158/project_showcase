import 'package:flutter/material.dart';
import 'package:project_showcase/models/actor.dart';
import 'package:project_showcase/config/size_config.dart';

class ActorItem extends StatelessWidget {

  final Actor actor;

  const ActorItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.defaultWidth*2),
      child: Column(
        children: [
          Container(
            height: SizeConfig.defaultHeight*12,
            width: SizeConfig.defaultWidth*12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SizeConfig.defaultHeight),
              child: Image.asset(
                  actor.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.defaultHeight,),
          Text(actor.name!,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(),
          ),
        ],
      ),
    );
  }
}
