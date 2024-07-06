import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AiModelView extends StatelessWidget {
  const AiModelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'Upload radiology ',
          style: StyleManager.textStyle24.copyWith(
            color: ColorsManager.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0).copyWith(
          bottom: 70,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.ai,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    'View photo',
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyle16.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              height: 72,
              decoration: ShapeDecoration(
                color: const Color(0x66D9D9D9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.aiLoading,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  DefaultTextStyle(
                    style: StyleManager.textStyle16.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w400,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(seconds: 2),
                      animatedTexts: [
                        TypewriterAnimatedText('Uploading...'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultAiContainer(IconlyLight.upload),
                const SizedBox(
                  width: 50,
                ),
                defaultAiContainer(IconlyLight.camera),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container defaultAiContainer(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: const ShapeDecoration(
        color: Color(0xFF44AECA),
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0xFF2DACD4),
            blurRadius: 5,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}
