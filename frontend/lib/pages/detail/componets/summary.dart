import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import 'actor_item.dart';

class Summary extends StatelessWidget {

  final String summary;

  const Summary({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18),
        ),
        SizedBox(height: SizeConfig.defaultHeight*0.5,),
        Text(summary,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),),
      ],
    );
  }
}
