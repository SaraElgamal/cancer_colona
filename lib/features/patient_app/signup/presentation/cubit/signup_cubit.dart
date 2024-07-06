import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var birthdayController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isSecure = true;
  var secureIcon=Icons.visibility_off_outlined;
  void changeSecure(){
    isSecure=!isSecure;
    secureIcon=isSecure?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(SignupChangeSecureIcon());
  }

}
