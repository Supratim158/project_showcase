import 'package:flutter/material.dart';
import 'package:project_showcase/notifiers/animation_notifier.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class WidthAnimation extends StatelessWidget {
  final double begin;
  final double end;
  final Widget child;

  const WidthAnimation({
    super.key,
    required this.begin,
    required this.end,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationNotifier>(
        builder: (context, value, child) {
          var controlAnimation = value.animateHomeToDetail
              ? CustomAnimationControl.play
              : CustomAnimationControl.playReverse;
          return CustomAnimation(
            control: controlAnimation,
            tween: Tween(begin: begin, end: end),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            builder: (context, child, value) {
              return SizedBox(
                width: value,
                child: child,
              );
            },
            child: child,
          );
        },
        child: child);
  }
}
