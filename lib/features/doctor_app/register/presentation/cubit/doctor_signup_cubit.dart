import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'doctor_signup_state.dart';

class DoctorSignupCubit extends Cubit<DoctorSignupState> {
  DoctorSignupCubit() : super(SignupInitial());
  static DoctorSignupCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var experienceController = TextEditingController();
  var hospitalController = TextEditingController();
  var descriptionController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var birthdayController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  var isSecure = true;
  var secureIcon = Icons.visibility_off_outlined;
  void changeSecure() {
    isSecure = !isSecure;
    secureIcon =
        isSecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SignupChangeSecureIcon());
  }

  presentDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(3030))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate = pickedDate;
      birthdayController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
    });
    emit(DatePickerState());
  }
}
