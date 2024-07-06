part of 'doctor_signup_cubit.dart';

@immutable
sealed class DoctorSignupState {}

final class SignupInitial extends DoctorSignupState {}

final class SignupChangeSecureIcon extends DoctorSignupState {}

final class DatePickerState extends DoctorSignupState {}
