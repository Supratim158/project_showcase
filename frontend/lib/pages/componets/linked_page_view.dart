import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../../notifiers/page_notifiers.dart';

class LinkedPageView extends StatefulWidget {
  final Function(int) backViewBuilder;
  final Function(int) frontViewBuilder;
  final int itemCount;

  const LinkedPageView(
      {super.key,
        required this.backViewBuilder,
        required this.frontViewBuilder,
        required this.itemCount});

  @override
  State<LinkedPageView> createState() => _LinkedPageViewState();
}

class _LinkedPageViewState extends State<LinkedPageView> {
  PageNotifier backPageNotifier = PageNotifier();
  PageNotifier frontPageNotifier = PageNotifier(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    frontPageNotifier.pageController..addListener(_onMainScroll);
  }

  @override
  void dispose() {
    frontPageNotifier.pageController.dispose();
    super.dispose();
  }

  _onMainScroll() {
    backPageNotifier.pageController
        .jumpTo(frontPageNotifier.pageController.offset / 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: frontPageNotifier,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              reverse: true,
              pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),
              controller: backPageNotifier.pageController,
              itemCount: widget.itemCount,
              itemBuilder: (context, index) => widget.backViewBuilder(index)
          ),

          Container(
              height: SizeConfig.screenHeight * 0.65,
              child: PageView.builder(
                  controller: frontPageNotifier.pageController,
                  itemCount: widget.itemCount,
                  itemBuilder: (context, index) =>
                      Consumer<PageNotifier>(builder: (context, value, child) {
                        return Transform.translate(offset: Offset(0, (value.currentPage - index).abs()*50),
                            child:Opacity(
                                opacity: max(1-(value.currentPage - index).abs()*0.5, 0.5),
                                child: child
                            ));
                      },
                          child: widget.frontViewBuilder(index))
              )
          ),
        ],
      ),
    );
  }
}
