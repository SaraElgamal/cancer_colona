import 'package:colona/core/errors/failures.dart';
import 'package:colona/features/doctor_manage/doctor_models/doctor_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, DoctorModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, DoctorModel>> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String dateOfBirth,
    required String role,
    required String experience,
    required String hospital,
    required String description,
  });
}
