import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/MoviePageParts/under_page.dart';
import 'package:movies_app/Widgets/custom_floating_action_buttom.dart';
import 'package:movies_app/Widgets/MoviePageParts/top_of_movie_page.dart';
import 'package:movies_app/generated/l10n.dart';

class MoviePage extends StatelessWidget {
  MoviePage({super.key, required this.movie});
  FullMovieModel movie;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Widget> Generes = [];
    List<Widget> genere() {
      for (var v in movie.finalGeneres) {
        Generes.add(Text(
          v,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ));
      }
      return Generes;
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          floatingActionButton:
              CustomFloatingActionButtom(scrollController: scrollController),
          body: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                 SliverAppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.cyan,
                  ),
                  pinned: true,
                  expandedHeight: 120.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      S.of(context).MovieDetails,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(children: [
                    TopOfPage(
                      movie: movie,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        Text(
                          ' ${movie.release_date != null && movie.release_date!.length >= 4 ? movie.release_date!.substring(0, 4) : 'Unknown'}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          '  |  ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        Text(
                          ' ${movie.runtime} ${S.of(context).Minutes}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          '  |  ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        Column(
                          children: genere(),
                        )
                      ],
                    ),
                    UnderPage(
                      movie: movie,
                    ),
                  ]),
                )
              ]),
        );
      },
    );
  }
}
