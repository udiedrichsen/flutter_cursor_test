import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  late SharedPreferences _prefs;

  @override
  FutureOr<ThemeMode> build() async {
    _prefs = await SharedPreferences.getInstance();
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isDarkMode = state.value == ThemeMode.dark;
    state = AsyncData(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    await _prefs.setBool('isDarkMode', !isDarkMode);
  }
}
