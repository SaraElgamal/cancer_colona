part of 'doctor_login_cubit.dart';

sealed class DoctorLoginState {}

final class LoginInitial extends DoctorLoginState {}

final class LoginChangeSecureIcon extends DoctorLoginState {}
