import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'l10n/app_localizations.dart';
import 'language_provider.dart';
import 'theme_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider);
    final localizations = AppLocalizations.of(context);
    final language = ref.watch(languageNotifierProvider);

    return themeMode.when(
      data: (mode) => _buildScaffold(mode, localizations, language),
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => Text(localizations.errorLoadingTheme),
    );
  }

  Widget _buildScaffold(ThemeMode mode, AppLocalizations localizations,
      AsyncValue<Locale> language) {
    final isDarkMode = mode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.appTitle),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () =>
                ref.read(themeNotifierProvider.notifier).toggleTheme(),
            tooltip: localizations.toggleThemeTooltip,
          ),
          language.when(
            data: (locale) => PopupMenuButton<String>(
              icon: Text(getFlag(locale.languageCode),
                  style: const TextStyle(fontSize: 24)),
              onSelected: (String languageCode) {
                ref
                    .read(languageNotifierProvider.notifier)
                    .setLanguage(languageCode);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'en',
                  child: Row(
                    children: [
                      Text('🇬🇧', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 10),
                      Text('English'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'de',
                  child: Row(
                    children: [
                      Text('🇩🇪', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 10),
                      Text('Deutsch'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'es',
                  child: Row(
                    children: [
                      Text('🇪🇸', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 10),
                      Text('Español'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'fr',
                  child: Row(
                    children: [
                      Text('🇫🇷', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 10),
                      Text('Français'),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Icon(Icons.error),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(localizations.pushButtonText),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: localizations.incrementTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  String getFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇬🇧';
      case 'de':
        return '🇩🇪';
      case 'es':
        return '🇪🇸';
      case 'fr':
        return '🇫🇷';
      default:
        return '🏳️';
    }
  }
}
