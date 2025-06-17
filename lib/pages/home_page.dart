import 'package:flutter/material.dart';
import 'package:project_showcase/components/movies/mvie_header.dart';
import 'package:project_showcase/components/ticket_button.dart';
import 'package:project_showcase/models/movie.dart';
import 'package:project_showcase/pages/componets/header.dart';
import 'package:project_showcase/pages/componets/linked_page_view.dart';
import 'package:project_showcase/pages/componets/movie_preview.dart';
import 'package:project_showcase/pages/detail/detail_page.dart';
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
              backViewBuilder: (index) => Container(
                child: Image.asset(
                  movies[index].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              frontViewBuilder: (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(movie: movies[index])));
                  },
                  child: MoviePreview(index: index)),
              itemCount: movies.length,
            ),
            Header(),
            Positioned(
                bottom: SizeConfig.defaultHeight ,
                child: SizedBox(
                  width: SizeConfig.screenWidth * 0.5,
                  child: TicketButton(),
                )),
          ],
        ),
      ),
    );
  }
}
