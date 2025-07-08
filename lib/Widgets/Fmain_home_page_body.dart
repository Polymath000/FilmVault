import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Bloc/cubit/change_language_cubit.dart';
import 'package:movies_app/Widgets/home_page_body.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/views/favorite.dart';
import 'package:movies_app/views/settings.dart';

class HomepageBody extends StatefulWidget {
  HomepageBody(
      {super.key, required this.scaffoldKey, required this.positionOfPage});
  final GlobalKey<ScaffoldState> scaffoldKey;
  int positionOfPage;
  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        bool isArabic = state.locale.languageCode == 'ar';
        return Scaffold(
          key: widget.scaffoldKey,
          drawer: Drawer(
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Colors.teal,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).AppName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).Enjoy,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: Text(
                      S.of(context).Home,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        widget.positionOfPage = 0;
                      });
                      widget.scaffoldKey.currentState?.closeDrawer();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.white),
                    title: Text(
                      S.of(context).favorites,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        widget.positionOfPage = 1;
                      });
                      widget.scaffoldKey.currentState?.closeDrawer();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      S.of(context).Settings,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        widget.positionOfPage = 2;
                      });
                      widget.scaffoldKey.currentState?.closeDrawer();
                    },
                  ),
                ],
              ),
            ),
          ),
          body: _getSelectedPage(),
        );
      },
    );
  }

  Widget _getSelectedPage() {
    switch (widget.positionOfPage) {
      case 0:
        return HomeBody();
      case 1:
        return const FavoriteMovies();
      case 2:
        return const Settings();
      default:
        return HomeBody();
    }
  }
}
