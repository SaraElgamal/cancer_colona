import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelFormField extends StatelessWidget {
  const LabelFormField({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    required this.controller,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.onChange,
    this.onTap,
    this.validator,
    this.maxLines = 1,
    this.hintText,
    this.suffixPadding = 5.0,
    this.prefixIcon,
  });

  final int maxLines;
  final double suffixPadding;
  final bool enabled;
  final bool readOnly;
  final bool? isPassword;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 55,
        child: TextFormField(
          validator: validator ??
              (value) {
                if (value!.isEmpty) {
                  return TranslationKeyManager.requiredField.tr;
                }
                return null;
              },
          minLines: 1,
          maxLength: 300,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: textInputType,
          controller: controller,
          onChanged: onChange,
          maxLines: maxLines,
          style: StyleManager.textStyle14.copyWith(
            fontSize: 15,
          ),
          obscureText: isPassword!,
          obscuringCharacter: '●',
          cursorColor: ColorsManager.primary,
          enabled: enabled,
          decoration: InputDecoration(
            fillColor: ColorsManager.white,
            counterText: "",
            filled: true,
            hintText: hintText,
            hintStyle: StyleManager.textStyle15,
            suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: suffixPadding),
              child: suffixIcon,
            ),
            prefixIcon: prefixIcon,
            errorStyle: StyleManager.textStyle14.copyWith(color: Colors.red),
            //contentPadding: const EdgeInsets.symmetric( vertical: 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorsManager.white,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorsManager.white,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
          ),
        ),
      ),
    );
  }
}
