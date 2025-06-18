import 'package:flutter/material.dart';
import 'package:project_showcase/size_config.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

import '../animations/load_animation.dart';
import '../notifiers/animation_notifier.dart';
import '../pages/home_page.dart';

class TicketButton extends StatefulWidget {


  const TicketButton({super.key});

  @override
  State<TicketButton> createState() => _TicketButtonState();
}

class _TicketButtonState extends State<TicketButton> {
  bool ticketPressed = false;
  @override
  Widget build(BuildContext context) {
    var animationControl = ticketPressed
        ? CustomAnimationControl.play
        : CustomAnimationControl.stop;

    return InkWell(
      onTap: () {
        setState(() {
          ticketPressed = !ticketPressed;
        });
        Future.delayed(
            Duration(milliseconds: 1000),
                () => Provider.of<AnimationNotifier>(context, listen: false)
                .playDetailToHomeAnimations());
        Future.delayed(
            Duration(milliseconds: 2000),
                () => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 0),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomePage(),
                )));
      },
      child: LoadAnimation(
        control: animationControl,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(SizeConfig.defaultHeight*1.5),
          ),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultHeight * 2),
          height: SizeConfig.defaultHeight * 6,
          child: Center(
            child: Opacity(
              opacity: ticketPressed ? 0 : 1,
              child: Text(
                "BUY TICKET",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
