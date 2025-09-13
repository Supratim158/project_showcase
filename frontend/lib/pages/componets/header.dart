import 'package:flutter/material.dart';
import '../../config/size_config.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.icon1, this.icon2});

  final IconData? icon1;
  final IconData? icon2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 7,
          left: SizeConfig.defaultWidth,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(icon1,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 7,
          right: SizeConfig.defaultWidth,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              onPressed: () {
                // Add settings navigation here
              },
              icon: Icon(icon2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}