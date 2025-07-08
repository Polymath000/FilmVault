import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Bloc/cubit/change_language_cubit.dart';
import 'package:movies_app/Widgets/customTextField.dart';
import 'package:movies_app/Widgets/show_movies_by_genere.dart';
import 'package:movies_app/Widgets/trending_view_builder.dart';
import 'package:movies_app/Widgets/upcoming_view_builder.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/generated/l10n.dart' show S;
import 'package:movies_app/views/search_page.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(
                  color: Colors.cyan,
                ),
                pinned: true,
                expandedHeight: 110.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    S.of(context).AppName,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  textField(
                    hint: S.of(context).search,
                    onChanged: (String name) {},
                    icon: Icons.search,
                    onFieldSubmitted: (String value) {
                      if (value.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(
                                    movieName: value,
                                  )),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        S.of(context).trending,
                        style: const TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const TrendingRow(),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        S.of(context).upcoming,
                        style: const TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const UpcomingRow(),
                  ShowMoviesByGenere(),
                ]),
              ),
            ]);
      },
    );
  }
}
