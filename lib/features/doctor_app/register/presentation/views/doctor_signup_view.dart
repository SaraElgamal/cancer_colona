import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/core_widgets/form_field/default_from.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/doctor_app/home/presentation/views/doctor_home_view.dart';
import 'package:colona/features/doctor_app/login/presentation/views/doctor_login_view.dart';
import 'package:colona/features/doctor_app/register/presentation/cubit/doctor_signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/Doctorpick_image.dart';

class DoctorSignUpView extends StatelessWidget {
  const DoctorSignUpView({super.key});
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
            child: BlocBuilder<DoctorSignupCubit, DoctorSignupState>(
              builder: (context, state) {
                var signupCubit = DoctorSignupCubit.get(context);
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
                      const DoctorPickImage(),
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
                          child: SvgPicture.asset(
                            AssetsManager.email,
                          ),
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
                        prefixIcon: IconButton(
                          icon: const Icon(
                            IconlyLight.calendar,
                            color: ColorsManager.primary,
                          ),
                          //signupCubit.presentDatePicker(context)
                          onPressed: () {
                            signupCubit.presentDatePicker(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.phone.tr,
                        controller: signupCubit.phoneController,
                        hintText: "enter phone",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          child: Icon(
                            IconlyLight.call,
                            color: ColorsManager.primary,
                          ),
                        ),
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.experience.tr,
                        controller: signupCubit.experienceController,
                        hintText: "enter experience",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          child: Icon(
                            IconlyLight.work,
                            color: ColorsManager.primary,
                          ),
                        ),
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.hospital.tr,
                        controller: signupCubit.hospitalController,
                        hintText: "enter hospital",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          child: Icon(
                            Icons.local_hospital_outlined,
                            color: ColorsManager.primary,
                          ),
                        ),
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.description.tr,
                        controller: signupCubit.descriptionController,
                        hintText: "enter description",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          child: Icon(
                            Icons.notes_outlined,
                            color: ColorsManager.primary,
                          ),
                        ),
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultForm(
                        text: TranslationKeyManager.password.tr,
                        controller: signupCubit.passwordController,
                        textInputType: TextInputType.visiblePassword,
                        hintText: "enter password",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12),
                          child: SvgPicture.asset(AssetsManager.lock),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorHomeView()));
                            },
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
                          TextButton(
                            child: Text(
                              TranslationKeyManager.logIn.tr,
                              style: StyleManager.textStyle16.copyWith(
                                fontWeight: FontWeight.normal,
                                color: ColorsManager.textButtonColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorLoginView()));
                            },
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
