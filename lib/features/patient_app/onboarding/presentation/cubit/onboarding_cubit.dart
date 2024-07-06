import 'package:colona/core/cache_helper/cache_helper_keys.dart';
import 'package:colona/core/cache_helper/cashe_helper.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/features/patient_app/login/presentation/views/login_view.dart';
import 'package:colona/features/patient_app/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  List<OnBoardingModel> sliderDataPhone = [
    OnBoardingModel(
        tittle: TranslationKeyManager.medicine.tr,
        image: AssetsManager.medical,
        note: TranslationKeyManager.medicineHint.tr),
    OnBoardingModel(
        tittle: TranslationKeyManager.meetingWithDoctor.tr,
        image: AssetsManager.meeting,
        note: TranslationKeyManager.meetingWithDoctorHint.tr),
    OnBoardingModel(
      tittle: TranslationKeyManager.symptomsOfTheDisease.tr,
      image: AssetsManager.breast,
      note: TranslationKeyManager.symptomsOfTheDiseaseHint.tr,
    ),
  ];
  bool isLast = false;
  final PageController pageController = PageController();

  void subMite(context) {
    CacheHelper.saveData(key: CacheHelperKeys.onBoarding, value: true)
        .then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) => false);
        emit(OnboardingSubMite());
      }
    });
  }

  void nextTapped(context) {
    if (isLast) {
      subMite(context);
    } else {
      pageController.nextPage(
          duration: const Duration(
            milliseconds: 700,
          ),
          curve: Curves.fastLinearToSlowEaseIn);
      emit(OnboardingNextTapped());
    }
  }
}
