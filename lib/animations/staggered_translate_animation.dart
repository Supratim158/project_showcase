import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

import '../notifiers/animation_notifier.dart';

class StaggeredTranslateAnimation extends StatelessWidget {

  final double translateX;
  final double translateY;
  final int delay;
  final Widget child;

  const StaggeredTranslateAnimation({super.key, this.translateX = -200.0,
    this.translateY = 200.0,
    this.delay = 0,
    required this.child,});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationNotifier>(
      builder: (context, value, child) {
        var controlAnimation = value.animateHomeToDetail
            ? CustomAnimationControl.play
            : CustomAnimationControl.playReverse;

        Widget translateAnimation = CustomAnimation(
          control: controlAnimation,
          duration: Duration(milliseconds: 300 + delay),
          delay: Duration(milliseconds: 150),
          tween: Tween(begin: translateY, end: 0.0),
          curve: Curves.easeOut,
          builder: (context, child, valueY) => Transform.translate(
            offset: Offset(0, valueY),
            child: CustomAnimation(
              control: controlAnimation,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 150),
              tween: Tween(begin: translateX, end: 0.0),
              builder: (context, child, valueX) => Transform.translate(
                offset: Offset(valueX, 0),
                child: child,
              ),
              child: child,
            ),
          ),
          child: child,
        );

        return translateAnimation;
      },
      child: child,
    );
  }
}
