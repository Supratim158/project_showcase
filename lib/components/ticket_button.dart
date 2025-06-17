import 'package:flutter/material.dart';
import 'package:project_showcase/size_config.dart';

class TicketButton extends StatelessWidget {
  const TicketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultHeight * 6,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        "BUY TICKET",
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
