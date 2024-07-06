import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.onPressed});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ColorsManager.defaultButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: StyleManager.textStyle16.copyWith(
              color: ColorsManager.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ));
  }
}
