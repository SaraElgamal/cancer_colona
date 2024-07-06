import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_page.dart';
import 'widgets/shared_smooth_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: OnboardingCubit.get(context).pageController,
        itemCount: OnboardingCubit.get(context).sliderDataPhone.length,
        itemBuilder: (context, index) => OnBoardingPage(
          model: OnboardingCubit.get(context).sliderDataPhone[index],
          index: index,
        ),
        onPageChanged: (index) {
          if (index ==
              OnboardingCubit.get(context).sliderDataPhone.length - 1) {
            setState(() {
              OnboardingCubit.get(context).isLast = true;
            });
          } else {
            setState(() {
              OnboardingCubit.get(context).isLast = false;
            });
          }
        },
      ),
      bottomNavigationBar: buildRow(context),
    );
  }

  buildRow(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var cubit = OnboardingCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(
            25.0,
          ),
          child: cubit.isLast
              ? DefaultButton(
                  text: TranslationKeyManager.start.tr,
                  onPressed: () => cubit.subMite(context),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        cubit.subMite(context);
                      },
                      child: Text(
                        TranslationKeyManager.skip.tr,
                        textAlign: TextAlign.center,
                        style: StyleManager.textStyle16,
                      ),
                    ),
                    SharedSmoothPage(
                      controller: cubit.pageController,
                      length: cubit.sliderDataPhone.length - 1,
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.nextTapped(context);
                      },
                      child: Text(
                        TranslationKeyManager.next.tr,
                        textAlign: TextAlign.center,
                        style: StyleManager.textStyle16.copyWith(
                          color: ColorsManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
