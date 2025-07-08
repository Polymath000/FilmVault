// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FilmVault`
  String get AppName {
    return Intl.message('FilmVault', name: 'AppName', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Now Playing`
  String get nowPlaying {
    return Intl.message('Now Playing', name: 'nowPlaying', desc: '', args: []);
  }

  /// `Top Rated`
  String get topRated {
    return Intl.message('Top Rated', name: 'topRated', desc: '', args: []);
  }

  /// `Popular`
  String get popular {
    return Intl.message('Popular', name: 'popular', desc: '', args: []);
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message('Upcoming', name: 'upcoming', desc: '', args: []);
  }

  /// `Trending`
  String get trending {
    return Intl.message('Trending', name: 'trending', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Enjoy with us`
  String get Enjoy {
    return Intl.message('Enjoy with us', name: 'Enjoy', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Dark`
  String get Dark {
    return Intl.message('Dark', name: 'Dark', desc: '', args: []);
  }

  /// `Light`
  String get Light {
    return Intl.message('Light', name: 'Light', desc: '', args: []);
  }

  /// `System`
  String get System {
    return Intl.message('System', name: 'System', desc: '', args: []);
  }

  /// `No favorite movies`
  String get NoFMovies {
    return Intl.message(
      'No favorite movies',
      name: 'NoFMovies',
      desc: '',
      args: [],
    );
  }

  /// `About the movie`
  String get AboutMovie {
    return Intl.message(
      'About the movie',
      name: 'AboutMovie',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message('Reviews', name: 'Reviews', desc: '', args: []);
  }

  /// `No reviews available`
  String get NoReviews {
    return Intl.message(
      'No reviews available',
      name: 'NoReviews',
      desc: '',
      args: [],
    );
  }

  /// `Movie details`
  String get MovieDetails {
    return Intl.message(
      'Movie details',
      name: 'MovieDetails',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again later.`
  String get ThereWasAnError {
    return Intl.message(
      'An error occurred, please try again later.',
      name: 'ThereWasAnError',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get NoInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get Minutes {
    return Intl.message('Minutes', name: 'Minutes', desc: '', args: []);
  }

  /// `Favorite Movies`
  String get FavoriteMovies {
    return Intl.message(
      'Favorite Movies',
      name: 'FavoriteMovies',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
