import 'dart:ui';

import '../cache_helper/cache_helper_keys.dart';

class TranslationKeyManager {
  static const Locale localeEN = Locale(CacheHelperKeys.keyEN);
  static const Locale localeAR = Locale(CacheHelperKeys.keyAR);

  // OnBoarding
  static const String medicine = 'Medicine';
  static const String medicineHint = 'Medicine Hint';
  static const String meetingWithDoctor = 'Meeting with doctor';
  static const String meetingWithDoctorHint = 'Meeting with doctor Hint';
  static const String symptomsOfTheDisease = 'Symptoms of the disease';
  static const String symptomsOfTheDiseaseHint = 'Symptoms of the disease Hint';

  //OnBoarding Button
  static const String next = 'Next';
  static const String skip = 'Skip';
  static const String start = 'Let’s start';

  //form field validation message
  static const String requiredField = 'This field is required';

  //login
  static const String welcomeBack = 'Welcome';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String phone = 'Phone Number';
  static const String experience = 'experience';
  static const String hospital = 'hospital';
  static const String description = 'description';
  static const String logIn = 'Log in';
  static const String forgetPassword = 'forget password';
  static const String logInVia = 'Or LogIn via';
  static const String google = 'Google';
  static const String facebook = 'Facebook';
  static const String haveNoAccount = 'don’t have an account';
  static const String signup = 'Signup';
  //signup
  static const String welcomeColona = 'Welcome to colona';
  static const String haveAccount = 'Already have an account?';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String birthday = 'Birthday';
  static const String address = 'Address';
  //welcome
  static const String welcome = 'Welcome';
  static const String welcomeMessage = 'Welcome Message';
  static const String goHome = 'go home';
  //home
  static const String home = 'Home';
  //doctor add drugs
  static const String addDrugs = 'Add Drugs';
  static const String drugName = 'Drug Name';
  static const String drugDescription = 'Drug Description';
  static const String times = 'Times';
  static const String save = 'Save';
}
