part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupChangeSecureIcon extends SignupState {}
