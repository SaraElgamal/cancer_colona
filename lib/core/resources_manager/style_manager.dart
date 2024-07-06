import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/constants_manager.dart';
import 'package:flutter/material.dart';

abstract class StyleManager {
  static TextStyle textStyle14 = const TextStyle(
    fontSize: 15,
    color: ColorsManager.black,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle13 = const TextStyle(
    fontSize: 13,
    color: ColorsManager.drugColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle10 = const TextStyle(
    fontSize: 12,
    color: ColorsManager.black,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle15 = const TextStyle(
    fontSize: 15,
    color: ColorsManager.formFieldHintColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle16 = const TextStyle(
    fontSize: 16,
    color: ColorsManager.onboardingSkipColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle20 = const TextStyle(
    fontSize: 20,
    color: ColorsManager.onboardingNoteColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle24 = const TextStyle(
    fontSize: 24,
    color: ColorsManager.onboardingTitleColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle32 = const TextStyle(
    fontSize: 32,
    color: ColorsManager.doneColor,
    fontFamily: ConstantsManager.fontFamily,
    fontWeight: FontWeight.bold,
  );
}
