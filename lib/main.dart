import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app/app.dart';
import 'core/cache_helper/cashe_helper.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/localization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await GetStorage.init();
  await AppLocalization.setLanguage();
  //setupForgotPassSingleton();
  runApp(MyApp());
}