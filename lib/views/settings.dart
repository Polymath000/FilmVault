import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Bloc/cubit/change_language_cubit.dart';
import 'package:movies_app/Widgets/change_language.dart';
import 'package:movies_app/generated/l10n.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    int index = AdaptiveTheme.of(context).mode.isDark
        ? 0
        : (AdaptiveTheme.of(context).mode.isLight ? 1 : 2);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 2, 2, 2),
            ),
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                S.of(context).Settings,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
                  builder: (context, state) {
                    bool vIsArabic = isArabic(state.locale);
                    return Row(
                      children: [
                        CustomButtomMode(
                          index: index,
                          text: S.of(context).Dark,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                            AdaptiveTheme.of(context).setDark();
                          },
                        ),
                        CustomButtomMode(
                          index: index,
                          text: S.of(context).System,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(0),
                          ),
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                            AdaptiveTheme.of(context).setSystem();
                          },
                        ),
                        CustomButtomMode(
                          index: index,
                          text: S.of(context).Light,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                            AdaptiveTheme.of(context).setLight();
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).Language,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const ChangeLanguage()
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

bool isArabic(Locale locale) {
  return locale.languageCode == 'ar';
}

class CustomButtomMode extends StatelessWidget {
  const CustomButtomMode({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
    required this.index,
  });
  final String text;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    int currentIndex = getindex(text);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 37),
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: currentIndex == index
                ? Colors.blue
                : Theme.of(context).scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  getindex(String text) {
    if (text == "Dark") {
      return 0;
    } else if (text == "Light") {
      return 1;
    } else {
      return 2;
    }
  }
}
