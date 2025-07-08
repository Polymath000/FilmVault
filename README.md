# Movies App

A Flutter application for browsing movies, featuring adaptive theming, localization (including Arabic support), and in-app upgrade alerts.

## Features

- **Adaptive Theming**: Light and dark mode support using [adaptive_theme](https://pub.dev/packages/adaptive_theme).
- **Localization**: Supports multiple languages, including Arabic (RTL) using [flutter_localizations](https://docs.flutter.dev/accessibility-and-localization/internationalization).
- **State Management**: Uses [flutter_bloc](https://pub.dev/packages/flutter_bloc) for managing language changes.
- **Responsive UI**: Built with [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for screen size adaptation.
- **Upgrade Alerts**: Notifies users of app updates using [upgrader](https://pub.dev/packages/upgrader).

## Project Structure

- `lib/views/HomePage.dart`: Main entry point for the app UI and theming.
- `lib/Bloc/cubit/change_language_cubit.dart`: Bloc for handling language changes.
- `lib/Widgets/Fmain_home_page_body.dart`: Main home page body widget.
- `lib/generated/l10n.dart`: Generated localization files.

## Localization

To add or update translations, edit the ARB files in `lib/l10n/` and regenerate with:
```bash
flutter pub run intl_utils:generate
```

## Theming

The app uses `AdaptiveTheme` to provide light and dark themes. The initial theme is set based on the user's system preference.

## Upgrade Alerts

The app uses the `upgrader` package to notify users when a new version is available.

## Screenshots

![Home](https://github.com/user-attachments/assets/0b030553-6f29-4a04-a673-7eeda76a95d3)
![Search](https://github.com/user-attachments/assets/9ed33365-9284-4624-9cc8-2d14b5220991)
![Movie Details](https://github.com/user-attachments/assets/4621bfea-b1ef-456e-8e6c-b12e4420a0ff)
![Favorites](https://github.com/user-attachments/assets/452eb14f-624d-43f0-9bc8-aeeb8862106e)

