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
  var secureIcon=Icons.visibility_off_outlined;
  void changeSecure(){
    isSecure=!isSecure;
    secureIcon=isSecure?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(LoginChangeSecureIcon());
  }
}
