import 'package:flutter/material.dart';
import 'package:project_showcase/components/movies/mvie_header.dart';
import 'package:project_showcase/components/ticket_button.dart';
import 'package:project_showcase/models/movie.dart';
import 'package:project_showcase/pages/componets/header.dart';
import 'package:project_showcase/pages/componets/linked_page_view.dart';
import 'package:project_showcase/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            LinkedPageView(
                backViewBuilder: (index)=>Container(
                  child: Image.asset(movies[index].imageUrl,fit: BoxFit.fill,),
                ),
                frontViewBuilder: (index)=> Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    // width: 100,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:
                          Radius.circular(SizeConfig.defaultHeight * 4),
                          topRight: Radius.circular(
                              SizeConfig.defaultHeight * 4)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.defaultHeight * 2,
                          horizontal: SizeConfig.defaultHeight * 2),
                      child: MovieHeader(movie: movies[index]),
                    ),
                  ),
                ),
                itemCount: movies.length,

            ),
            Header(),
            Positioned(
                bottom: SizeConfig.defaultHeight * 1.5,
                child: SizedBox(
                  width: SizeConfig.screenWidth * 0.5,
                  child: TicketButton(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
