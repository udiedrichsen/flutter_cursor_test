import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_provider.g.dart';

@Riverpod(keepAlive: true)
class LanguageNotifier extends _$LanguageNotifier {
  late SharedPreferences _prefs;

  @override
  FutureOr<Locale> build() async {
    _prefs = await SharedPreferences.getInstance();
    final languageCode = _prefs.getString('languageCode') ?? 'en';
    return Locale(languageCode);
  }

  Future<void> setLanguage(String languageCode) async {
    state = AsyncData(Locale(languageCode));
    await _prefs.setString('languageCode', languageCode);
  }
}
