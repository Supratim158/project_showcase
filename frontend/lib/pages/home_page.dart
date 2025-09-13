import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_showcase/models/movie.dart';
import 'package:project_showcase/notifiers/animation_notifier.dart';
import 'package:project_showcase/pages/componets/header.dart';
import 'package:project_showcase/pages/componets/linked_page_view.dart';
import 'package:project_showcase/pages/componets/movie_preview.dart';
import 'package:project_showcase/pages/detail/detail_page.dart';
import 'package:provider/provider.dart';

import '../config/size_config.dart';
import 'componets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: AppDrawer(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            LinkedPageView(
              backViewBuilder: (index) => Container(
                child: Image.asset(
                  movies[index].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              frontViewBuilder: (index) => GestureDetector(
                  onTap: () {
                    Provider.of<AnimationNotifier>(context, listen: false).playHomeToDetailAnimations();
                    Future.delayed(Duration(milliseconds: 120),()=>Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                DetailPage(movie: movies[index]))));
                  },
                  child: MoviePreview(index: index)),
              itemCount: movies.length,
            ),
            Header(icon1: Icons.menu,icon2: CupertinoIcons.settings_solid,),
            // Positioned(
            //     bottom: SizeConfig.defaultHeight ,
            //     child: SizedBox(
            //       width: SizeConfig.screenWidth * 0.7,
            //       child: TicketButton(),
            //     )),
          ],
          
        ),

      ),
    );
  }
}
