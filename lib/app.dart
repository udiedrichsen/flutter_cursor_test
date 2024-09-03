import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'l10n/app_localizations.dart';
import 'language_provider.dart';
import 'theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final language = ref.watch(languageNotifierProvider);

    return language.when(
      data: (locale) => MaterialApp(
        title: 'Moinsen: Cursor Test',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode.when(
          data: (mode) => mode,
          loading: () => ThemeMode.system,
          error: (_, __) => ThemeMode.system,
        ),
        locale: locale,
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
          Locale('es'),
          Locale('fr'),
        ],
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: themeMode.when(
          data: (_) => const MyHomePage(),
          loading: () => const CenteredLoadingIndicator(),
          error: (_, __) => const ErrorScreen(),
        ),
      ),
      loading: () => const MaterialApp(home: CenteredLoadingIndicator()),
      error: (_, __) => const MaterialApp(home: ErrorScreen()),
    );
  }
}

class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('An error occurred while loading the theme.'),
      ),
    );
  }
}
