import 'package:colona/core/cache_helper/cache_data.dart';
import 'package:colona/core/localization/app_localization.dart';
import 'package:colona/core/resources_manager/constants_manager.dart';
import 'package:colona/core/resources_manager/theme_manager.dart';
import 'package:colona/features/doctor_app/add_drugs_view/presentation/add_drug_cubit_ui/add_drug_ui_cubit.dart';
import 'package:colona/features/doctor_app/login/presentation/login_cubit/doctor_login_cubit.dart';
import 'package:colona/features/doctor_app/register/presentation/cubit/doctor_signup_cubit.dart';
import 'package:colona/features/patient_app/login/presentation/login_cubit/login_cubit.dart';
import 'package:colona/features/patient_app/login/presentation/views/login_view.dart';
import 'package:colona/features/patient_app/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:colona/features/patient_app/signup/presentation/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal(); // singleton
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => DoctorSignupCubit()),
        BlocProvider(create: (context) => DoctorLoginCubit()),
        BlocProvider(create: (context) => AddDrugUiCubit()),
      ],
      child: GetMaterialApp(
        title: ConstantsManager.appTitle,
        theme: ThemeManager.light,
        locale: Locale(CacheData.lang!),
        translations: AppLocalization(),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        // home: AnimatedSplashScreen(
        //   splash: const SplashView(),
        //   splashIconSize: double.infinity,
        //   nextScreen: const OnboardingView(),
        //   splashTransition: SplashTransition.scaleTransition,
        //   backgroundColor: Colors.white,
        //   duration: 3000,
        // ),
      ),
    );
  }
}
