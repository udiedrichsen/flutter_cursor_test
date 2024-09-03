import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cursor/theme_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('ThemeNotifier initial state is light mode', () async {
    final themeMode = await container.read(themeNotifierProvider.future);
    expect(themeMode, equals(ThemeMode.light));
  });

  test('ThemeNotifier toggles between light and dark mode', () async {
    final notifier = container.read(themeNotifierProvider.notifier);

    // Initial state should be light mode
    var themeMode = await container.read(themeNotifierProvider.future);
    expect(themeMode, equals(ThemeMode.light));

    // Toggle to dark mode
    await notifier.toggleTheme();
    themeMode = container.read(themeNotifierProvider).value!;
    expect(themeMode, equals(ThemeMode.dark));

    // Toggle back to light mode
    await notifier.toggleTheme();
    themeMode = container.read(themeNotifierProvider).value!;
    expect(themeMode, equals(ThemeMode.light));
  });

  test('ThemeNotifier persists theme mode in SharedPreferences', () async {
    final notifier = container.read(themeNotifierProvider.notifier);

    // Toggle to dark mode
    await notifier.toggleTheme();

    // Check if the theme mode is persisted
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode');
    expect(isDarkMode, isTrue);

    // Toggle back to light mode
    await notifier.toggleTheme();

    // Check if the theme mode is updated in SharedPreferences
    final updatedIsDarkMode = prefs.getBool('isDarkMode');
    expect(updatedIsDarkMode, isFalse);
  });

  test('ThemeNotifier loads persisted theme mode on initialization', () async {
    // Set initial value in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', true);

    // Create a new container to trigger a new build of the provider
    final newContainer = ProviderContainer();

    // Check if the loaded theme mode matches the persisted value
    final themeMode = await newContainer.read(themeNotifierProvider.future);
    expect(themeMode, equals(ThemeMode.dark));

    newContainer.dispose();
  });
}
