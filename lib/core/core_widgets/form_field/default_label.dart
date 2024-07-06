import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class DefaultLabel extends StatelessWidget {
    const DefaultLabel({
    super.key,
    required this.text,
   });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleManager.textStyle14
    );
  }
}
