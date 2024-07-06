import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/onboarding/data/models/onboarding_model.dart';
import 'package:colona/features/patient_app/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.model, required this.index});

  final OnBoardingModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
      var cubit = OnboardingCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   model.image,
              //   width: 200,
              //   height: 200,
              // ),
              const SizedBox(
                height: 50,
              ),
              Text(
                model.tittle,
                textAlign: TextAlign.center,
                style: StyleManager.textStyle24,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                model.note,
                textAlign: TextAlign.center,
                style: StyleManager.textStyle20,
              ),
            ],
          ),
        ),
      );
    });
  }

  // startButton(OnboardingCubit cubit, BuildContext context) => InkWell(
  //       onTap: () => cubit.subMite(context),
  //       child: Container(
  //         width: 230,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: ColorsManager.blueColor,
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         child: Center(
  //           child: Text("Start",
  //               style: StyleManager.textStyle18.copyWith(
  //                 color: ColorsManager.white,
  //                 fontWeight: FontWeight.w500,
  //               )),
  //         ),
  //       ),
  //     );
}
