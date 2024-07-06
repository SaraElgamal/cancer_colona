import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    required this.maxLines,
    required this.maxLength,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final int maxLines;
  final int maxLength;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText!,
      decoration: InputDecoration(
        suffixIconColor: theme.primaryColor,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: theme.textTheme.bodyMedium,
        hintText: hintText,
      ),
    );
  }
}
