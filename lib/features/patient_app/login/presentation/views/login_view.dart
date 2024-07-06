import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/core_widgets/form_field/default_from.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                var loginCubit = LoginCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      AssetsManager.logo,
                      width: 103,
                      height: 111,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        TranslationKeyManager.welcomeBack.tr,
                        style: StyleManager.textStyle20.copyWith(
                          color: ColorsManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultForm(
                      text: TranslationKeyManager.email.tr,
                      controller: loginCubit.emailController,
                      hintText: "example@gmail.com",
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SvgPicture.asset(
                          AssetsManager.email,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DefaultForm(
                      text: TranslationKeyManager.password.tr,
                      controller: loginCubit.passwordController,
                      hintText: "enter password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12),
                        child: SvgPicture.asset(AssetsManager.lock),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginCubit.changeSecure();
                        },
                        icon: Icon(
                          loginCubit.secureIcon,
                          color: ColorsManager.primary,
                        ),
                      ),
                      isPassword: loginCubit.isSecure,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          TranslationKeyManager.forgetPassword.tr,
                          textAlign: TextAlign.end,
                          style: StyleManager.textStyle14.copyWith(
                            color: ColorsManager.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: DefaultButton(
                          text: TranslationKeyManager.logIn.tr,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TranslationKeyManager.haveNoAccount.tr,
                          style: StyleManager.textStyle15,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            TranslationKeyManager.signup.tr,
                            style: StyleManager.textStyle15.copyWith(
                              color: ColorsManager.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
