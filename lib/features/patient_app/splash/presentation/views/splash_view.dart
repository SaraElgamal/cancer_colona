import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset(AssetsManager.logo, width: 250, height: 250,color: ColorsManager.primary,),
          const SizedBox(height: 30,),
          Lottie.asset(AssetsManager.splashLoading,width: 250,height: 150),
        ],
      ),
    );
  }
}
