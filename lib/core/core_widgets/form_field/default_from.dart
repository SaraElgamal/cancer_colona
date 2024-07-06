import 'package:flutter/material.dart';
import 'default_label.dart';
import 'label_form_field.dart';

class DefaultForm extends StatelessWidget {
   const DefaultForm({
    super.key,
    required this.text,
    this.enabled = true,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.readOnly = false,
    this.onChange,
    this.onTap,
    this.validator,
    this.maxLines = 1,
    this.suffixPadding = 5.0,
    this.hintText,
   });

  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final bool? isPassword;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String text;
  final double suffixPadding;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        DefaultLabel(
            text: text,

        ),
        const SizedBox(
          height: 8,
        ),
        LabelFormField(
          readOnly: readOnly,
          hintText: hintText,
          suffixPadding: suffixPadding,
          controller: controller,
          enabled: enabled,
          onChange: onChange,
          onTap: onTap,
          isPassword: isPassword,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          textInputType: textInputType,
          maxLines: maxLines,
          validator: validator,
        )
      ],
    );
  }
}
