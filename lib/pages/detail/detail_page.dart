import 'package:flutter/material.dart';
import 'package:project_showcase/components/back_container.dart';
import 'package:project_showcase/components/movies/mvie_header.dart';
import 'package:project_showcase/pages/componets/header.dart';
import 'package:project_showcase/pages/detail/componets/cast.dart';
import 'package:project_showcase/pages/detail/componets/summary.dart';
import 'package:project_showcase/size_config.dart';

import '../../components/ticket_button.dart';
import '../../models/movie.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Header(),
            Container(
              height: SizeConfig.screenHeight * 0.7,
              child: BackContainer(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultWidth,
                      vertical: SizeConfig.defaultHeight * 2),
                  physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieHeader(movie: widget.movie),
                        SizedBox(height: SizeConfig.defaultHeight),
                        Center(
                          child: Text(
                            "Director / ${widget.movie.director}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black87),
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultHeight * 4),
                        Cast(
                          cast: widget.movie.cast!,
                        ),
                        SizedBox(height: SizeConfig.defaultHeight * 4),
                        Summary(summary: widget.movie.summary),
                        SizedBox(height: SizeConfig.defaultHeight * 8),
                      ],
                    ),
                  ),
              ),
              ),
            // Container(
            //   height: SizeConfig.screenHeight * 0.7,
            //   child: BackContainer(
            //       child: SingleChildScrollView(
            //         padding: EdgeInsets.symmetric(
            //             horizontal: SizeConfig.defaultWidth,
            //             vertical: SizeConfig.defaultHeight * 2),
            //         physics: BouncingScrollPhysics(),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //         MovieHeader(movie: widget.movie),
            //         SizedBox(
            //           height: SizeConfig.defaultHeight,
            //         ),
            //         Center(
            //           child: Text(
            //             "Director : ${widget.movie.director}",
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .labelLarge
            //                 ?.copyWith(color: Colors.black87),
            //           ),
            //         ),
            //
            //         SizedBox(height: SizeConfig.defaultHeight*4),
            //         Cast(cast: widget.movie.cast!),
            //         SizedBox(height: SizeConfig.defaultHeight*4),
            //         Summary(summary: widget.movie.summary),
            //                         ],
            //                       ),
            //       )),
            // ),
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
