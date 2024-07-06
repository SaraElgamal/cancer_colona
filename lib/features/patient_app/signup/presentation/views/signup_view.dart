import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/core_widgets/form_field/default_from.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/signup/presentation/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/pick_image.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ).copyWith(
            bottom: 30,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                var signupCubit = SignupCubit.get(context);
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          TranslationKeyManager.welcomeColona.tr,
                          style: StyleManager.textStyle20.copyWith(
                            color: ColorsManager.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const PickImage(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: DefaultForm(
                            text: TranslationKeyManager.firstName.tr,
                            controller: signupCubit.firstNameController,
                            hintText: "first name",
                          )),
                          const SizedBox(
                            width: 17,
                          ),
                          Expanded(
                              child: DefaultForm(
                            text: TranslationKeyManager.lastName.tr,
                            controller: signupCubit.lastNameController,
                            hintText: "last name",
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.email.tr,
                        controller: signupCubit.emailController,
                        hintText: "example@gmail.com",
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          // child: SvgPicture.asset(
                          //   AssetsManager.email,
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.address.tr,
                        controller: signupCubit.addressController,
                        hintText: "cairo, egypt",
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          IconlyLight.location,
                          color: ColorsManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.birthday.tr,
                        controller: signupCubit.birthdayController,
                        hintText: "14/2/2023",
                        prefixIcon: const Icon(
                          IconlyLight.calendar,
                          color: ColorsManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.password.tr,
                        controller: signupCubit.passwordController,
                        hintText: "enter password",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          // child: SvgPicture.asset(AssetsManager.lock),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            signupCubit.changeSecure();
                          },
                          icon: Icon(
                            signupCubit.secureIcon,
                            color: ColorsManager.primary,
                          ),
                        ),
                        isPassword: signupCubit.isSecure,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: DefaultButton(
                            text: TranslationKeyManager.signup.tr,
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
                            TranslationKeyManager.haveAccount.tr,
                            style: StyleManager.textStyle16.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ColorsManager.formFieldHintColor,
                            ),
                          ),
                          Text(
                            TranslationKeyManager.logIn.tr,
                            style: StyleManager.textStyle16.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ColorsManager.textButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ]);
              },
            ),
          ),
        ));
  }
}
