import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final currentTheme = prefs.getString(AppTheme.themePrefKey) ?? 'system';

    return switch (currentTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system
    };
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    final prefs = await SharedPreferences.getInstance();

    switch (theme) {
      case ThemeMode.light:
        await prefs.setString(AppTheme.themePrefKey, 'light');
      case ThemeMode.dark:
        await prefs.setString(AppTheme.themePrefKey, 'dark');
      default:
        await prefs.setString(AppTheme.themePrefKey, 'system');
    }
  }
}
