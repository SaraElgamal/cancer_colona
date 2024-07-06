import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_login_state.dart';

class DoctorLoginCubit extends Cubit<DoctorLoginState> {
  DoctorLoginCubit() : super(LoginInitial());
  static DoctorLoginCubit get(context) => BlocProvider.of(context);
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
}
