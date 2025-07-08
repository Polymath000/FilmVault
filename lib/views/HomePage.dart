import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Bloc/cubit/change_language_cubit.dart';
import 'package:movies_app/Widgets/Fmain_home_page_body.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:upgrader/upgrader.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int positionOfPage = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return AdaptiveTheme(
            light: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorSchemeSeed: Colors.blue,
            ),
            dark: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: const Color(primaryColor),
            ),
            builder: (theme, darkTheme) =>
                BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
              builder: (context, state) {
                bool isArabic = state.locale.languageCode == 'ar';
                return MaterialApp(
                  locale: state.locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: theme,
                  themeMode: ThemeMode.system,
                  debugShowCheckedModeBanner: false,
                  home: UpgradeAlert(
                    child: Directionality(
                      textDirection:
                          isArabic ? TextDirection.rtl : TextDirection.ltr,
                      child: HomepageBody(
                        positionOfPage: positionOfPage,
                        scaffoldKey: _scaffoldKey,
                      ),
                    ),
                  ),
                );
              },
            ),
            initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
          );
        },
      ),
    );
  }
}
