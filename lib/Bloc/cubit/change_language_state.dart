part of 'change_language_cubit.dart';

@immutable
abstract class ChangeLanguageState {
  final Locale locale;
  const ChangeLanguageState(this.locale);
}

class ChangeLanguageInitial extends ChangeLanguageState {
  ChangeLanguageInitial(Locale locale) : super(locale);
}

class ChangeLanguageChanged extends ChangeLanguageState {
  ChangeLanguageChanged(Locale locale) : super(locale);
}
