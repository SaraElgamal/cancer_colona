import 'package:colona/features/doctor_manage/doctor_models/doctor_model.dart';
import 'package:colona/features/doctor_manage/doctor_repo/auth_repos/doctor_auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_auth_state.dart';

class DoctorAuthCubit extends Cubit<DoctorAuthState> {
  DoctorAuthCubit(this.authRepoImp) : super(DoctorAuthInitial());
  final AuthRepoImp authRepoImp;
  static DoctorAuthCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var response = await authRepoImp.login(
      email: email,
      password: password,
    );
    response.fold((failure) {
      emit(LoginErrorState(failure.errorMessage));
    }, (result) async {
      emit(LoginSuccessState(result));
    });
  }

  Future signup({
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
    emit(RegisterLoadingState());
    var response = await authRepoImp.signup(
      email: email,
      password: password,
      passwordConfirm: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      dateOfBirth: dateOfBirth,
      role: role,
      experience: experience,
      hospital: hospital,
      description: description,
    );
    response.fold((failure) {
      emit(RegisterErrorState(failure.errorMessage));
    }, (result) async {
      emit(RegisterSuccessState(result));
    });
  }
}
