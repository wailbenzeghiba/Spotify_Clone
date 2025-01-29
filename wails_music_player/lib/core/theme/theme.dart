import 'package:flutter/material.dart';
import 'package:wails_music_player/core/theme/app_pallette.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Pallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.borderColor,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          )),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 17, color: Colors.white),
      ));
}
