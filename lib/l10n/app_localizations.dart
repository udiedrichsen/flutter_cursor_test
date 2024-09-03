import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'appTitle': 'Moinsen: Cursor Test',
      'pushButtonText': 'You have pushed the button this many times:',
      'incrementTooltip': 'Increment',
      'toggleThemeTooltip': 'Toggle theme',
      'errorLoadingTheme': 'An error occurred while loading the theme.',
    },
    'de': {
      'appTitle': 'Moinsen: Cursor Test',
      'pushButtonText': 'Sie haben den Knopf so oft gedrückt:',
      'incrementTooltip': 'Erhöhen',
      'toggleThemeTooltip': 'Thema umschalten',
      'errorLoadingTheme': 'Beim Laden des Themas ist ein Fehler aufgetreten.',
    },
    'es': {
      'appTitle': 'Moinsen: Prueba de Cursor',
      'pushButtonText': 'Has pulsado el botón este número de veces:',
      'incrementTooltip': 'Incrementar',
      'toggleThemeTooltip': 'Cambiar tema',
      'errorLoadingTheme': 'Ocurrió un error al cargar el tema.',
    },
    'fr': {
      'appTitle': 'Moinsen: Test de Curseur',
      'pushButtonText': 'Vous avez appuyé sur le bouton ce nombre de fois :',
      'incrementTooltip': 'Incrémenter',
      'toggleThemeTooltip': 'Changer le thème',
      'errorLoadingTheme':
          'Une erreur s\'est produite lors du chargement du thème.',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;
  String get pushButtonText =>
      _localizedValues[locale.languageCode]!['pushButtonText']!;
  String get incrementTooltip =>
      _localizedValues[locale.languageCode]!['incrementTooltip']!;
  String get toggleThemeTooltip =>
      _localizedValues[locale.languageCode]!['toggleThemeTooltip']!;
  String get errorLoadingTheme =>
      _localizedValues[locale.languageCode]!['errorLoadingTheme']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'de', 'es', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
