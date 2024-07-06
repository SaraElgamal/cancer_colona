import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80,),
          Container(
            width: 121,
            height: 121,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetsManager.steve),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${TranslationKeyManager.welcome.tr} Starve",
            style: StyleManager.textStyle24.copyWith(
              color: ColorsManager.black,
            ),
          ),
          const SizedBox(height: 14,),
          Text(
            TranslationKeyManager.welcomeMessage.tr,
            textAlign: TextAlign.center,
            style: StyleManager.textStyle16.copyWith(
              color: ColorsManager.formFieldHintColor,
            ),
          ),
          const SizedBox(height: 28,),
          SizedBox(
            width: 260,
              child: DefaultButton(text: TranslationKeyManager.goHome.tr, onPressed: (){},)),
        ],

      ),
    );
  }
}
