import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'constants_manager.dart';

class ThemeManager {
  static final light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      surfaceTintColor: ColorsManager.white,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: ColorsManager.primary),
    textTheme: Typography().black.apply(
          fontFamily: ConstantsManager.fontFamily,
        ),
    brightness: Brightness.light,
  );
}
