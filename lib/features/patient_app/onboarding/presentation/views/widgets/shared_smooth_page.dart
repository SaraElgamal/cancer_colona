import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SharedSmoothPage extends StatelessWidget {
  const SharedSmoothPage({super.key, required this.controller, required this.length});
final PageController controller;
final int length;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        effect: const WormEffect(
            dotColor: Colors.grey,
            activeDotColor: ColorsManager.primary,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 6.0,
            paintStyle: PaintingStyle.fill,
        ),
        count: length);
  }
}
