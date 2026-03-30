import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SharedPreferences sharedPreferences;

  static const String _themeKey = 'theme_preference';
  static const String _localeKey = 'locale_preference';

  SettingsCubit({required this.sharedPreferences}) : super(const SettingsState()) {
    _loadSettings();
  }

  void _loadSettings() {
    final themeIndex = sharedPreferences.getInt(_themeKey);
    final theme = themeIndex != null ? ThemeMode.values[themeIndex] : ThemeMode.system;

    final locale = sharedPreferences.getString(_localeKey) ?? 'uz';

    emit(state.copyWith(themeMode: theme, localeCode: locale));
  }

  Future<void> updateTheme(ThemeMode themeMode) async {
    await sharedPreferences.setInt(_themeKey, themeMode.index);
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> updateLocale(String localeCode) async {
    await sharedPreferences.setString(_localeKey, localeCode);
    emit(state.copyWith(localeCode: localeCode));
  }
}
