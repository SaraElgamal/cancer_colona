part of 'doctor_auth_cubit.dart';

@immutable
sealed class DoctorAuthState {}

final class DoctorAuthInitial extends DoctorAuthState {}

//login
final class LoginLoadingState extends DoctorAuthState {}

final class LoginSuccessState extends DoctorAuthState {
  final DoctorModel model;
  LoginSuccessState(
    this.model,
  );
}

final class LoginErrorState extends DoctorAuthState {
  final String error;
  LoginErrorState(this.error);
}

//register
final class RegisterLoadingState extends DoctorAuthState {}

final class RegisterSuccessState extends DoctorAuthState {
  final DoctorModel result;
  RegisterSuccessState(this.result);
}

final class RegisterErrorState extends DoctorAuthState {
  final String error;
  RegisterErrorState(this.error);
}
