import 'package:colona/core/cache_helper/cache_data.dart';
import 'package:colona/core/cache_helper/cache_helper_keys.dart';
import 'package:colona/core/cache_helper/cashe_helper.dart';
import 'package:colona/core/dio_helper/dio_helper.dart';
import 'package:colona/core/dio_helper/end_points.dart';
import 'package:colona/core/errors/failures.dart';
import 'package:colona/features/doctor_manage/doctor_models/doctor_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'doctor_auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either<Failure, DoctorModel>> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> map = {
        'email': email,
        'password': password,
        "rememberMe": true,
      };
      var data = await DioHelper.postDate(url: EndPoints.login, data: map);

      DoctorModel response = DoctorModel.fromJson(data.data);
      String token = response.token!;
      CacheHelper.saveData(key: CacheHelperKeys.tokenKey, value: token)
          .then((value) {
        CacheData.token = token;
      });
      print("login successfully");
      return right(response);
    } catch (e) {
      print("login error");
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      Map<String, dynamic> map = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "phone": phone,
        "address": address,
        "dateOfBirth": dateOfBirth,
        "role": role,
        "experience": experience,
        "hospital": hospital,
        "description": description,
      };
      var data = await DioHelper.postDate(url: EndPoints.signup, data: map);
      DoctorModel response = DoctorModel.fromJson(data.data);
      print("signup successfully");
      return right(response);
    } catch (e) {
      print("signup error");
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
