import 'package:flutter/material.dart';

import '../../size_config.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 7,
            left: SizeConfig.defaultWidth,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ))),
        Positioned(
            top: 7 ,
            right: SizeConfig.defaultWidth,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.adjust,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
