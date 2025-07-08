import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Bloc/cubit/change_language_cubit.dart';
import 'package:movies_app/generated/l10n.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.locale.languageCode,
          items: S.delegate.supportedLocales.map((Locale locale) {
            return DropdownMenuItem<String>(
              value: locale.languageCode,
              child: Text(locale.toString()),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              final newLocale = S.delegate.supportedLocales.firstWhere(
                (locale) => locale.languageCode == newValue,
                orElse: () => const Locale('en'),
              );
              context.read<ChangeLanguageCubit>().changeLanguage(newLocale);
              S.load(newLocale);
            }
          },
        );
      },
    );
  }
}
