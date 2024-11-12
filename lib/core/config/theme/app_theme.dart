
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_learn/core/config/theme/typography.dart';
import 'colors_app.dart';

part 'color_scheme.dart';
part 'utils.dart';

const defaultAppTheme = ThemeMode.dark;

final mapAppThemeMode = <String, ThemeMode>{
  ThemeMode.dark.name: ThemeMode.dark,
};

var sysBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

ThemeData getAppTheme(ThemeMode mode, BuildContext context) {
  final mapAppTheme = <ThemeMode, ThemeData>{
    ThemeMode.dark: AppTheme.dark(context),
  };

  return mapAppTheme[mode]!;
}

class AppTheme {
  static ThemeData get _builtInLightTheme => ThemeData.light();

  static ThemeData get _builtInDarkTheme => ThemeData.dark();



  static ThemeData dark(BuildContext context) {
    final textTheme = appTextTheme(
      context,
      _builtInDarkTheme.textTheme,
      _darkColorScheme.onBackground,
    );

    return _builtInDarkTheme.copyWith(
      colorScheme: _darkColorScheme,
      textTheme: textTheme,
      typography: Typography.material2018(),
      elevatedButtonTheme: _elevatedButtonTheme(_darkColorScheme, textTheme),
      textButtonTheme: _textButtonTheme(_darkColorScheme, textTheme),
      scaffoldBackgroundColor: _darkColorScheme.background,
      appBarTheme: _appBarTheme(_builtInDarkTheme, _darkColorScheme, textTheme, ThemeMode.dark),
      dividerTheme: _dividerTheme(_builtInDarkTheme, _darkColorScheme),
      primaryColor: _darkColorScheme.primary,
      bottomSheetTheme: _bottomSheetThemeData(_builtInDarkTheme),
    );
  }
}
