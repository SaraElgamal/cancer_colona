import 'package:colona/core/dio_helper/dio_helper.dart';
import 'package:colona/core/dio_helper/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isSecure = true;
  var secureIcon = Icons.visibility_off_outlined;
  void changeSecure() {
    isSecure = !isSecure;
    secureIcon =
        isSecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangeSecureIcon());
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> map = {
        'email': email,
        'password': password,
      };
      var data = await DioHelper.postDate(url: EndPoints.login, data: map);
      print("login response: true");
      print(data.data);
      emit(LoginSuccessState());
    } catch (e) {
      print("login error");
      print(e.toString());
      if (e is DioException) {
        print("exption");
        emit(LoginErrorState(e.toString()));
      }
    }
  }
}
