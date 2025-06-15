import 'package:flutter/material.dart';
import 'package:project_showcase/size_config.dart';

class TicketButton extends StatelessWidget {
  const TicketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultHeight*2, horizontal: SizeConfig.defaultHeight * 6),
      child: Center(
        child: Text("BUY TICKET",style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white, fontSize: 15
        ),),
      ),
    );
  }
}
