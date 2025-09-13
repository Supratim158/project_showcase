// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  final double viewportFraction;

  late PageController pageController;

  double currentPage = 0;

  PageNotifier({this.viewportFraction = 1}){
    pageController = PageController(viewportFraction: viewportFraction);
    pageController.addListener((){
      currentPage = pageController.page!;
      notifyListeners();
    });
  }

}