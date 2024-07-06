import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class AiResultView extends StatelessWidget {
  const AiResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 100),
        child: Column(
          children: [
            Image.asset(
              AssetsManager.stomach,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              height: 30,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Oh!  ',
                    style: StyleManager.textStyle20.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'you have colona cancer',
                    style: StyleManager.textStyle20.copyWith(
                      color: ColorsManager.textButtonColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
