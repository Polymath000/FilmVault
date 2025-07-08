import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/generated/l10n.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial(const Locale('en')));

  void changeLanguage(Locale locale) {
    emit(ChangeLanguageChanged(locale));
    S.load(locale);
  }
}
