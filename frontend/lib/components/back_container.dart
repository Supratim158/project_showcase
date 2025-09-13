import 'package:flutter/material.dart';

import '../config/size_config.dart';

class BackContainer extends StatelessWidget {

  final Widget child;

  const BackContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.defaultHeight * 4),
                topRight: Radius.circular(SizeConfig.defaultHeight * 4))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultHeight ,
              horizontal: SizeConfig.defaultWidth ),
          child: child,
    ));
  }
}
