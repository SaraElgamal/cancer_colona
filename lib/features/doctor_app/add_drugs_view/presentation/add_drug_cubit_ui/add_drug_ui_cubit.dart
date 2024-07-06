import 'dart:io';

import 'package:colona/features/doctor_app/add_drugs_view/presentation/views/add_drugs_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_drug_ui_state.dart';

class AddDrugUiCubit extends Cubit<AddDrugUiState> {
  AddDrugUiCubit() : super(AddDrugUiInitial());
  static AddDrugUiCubit get(context) => BlocProvider.of(context);
  List<DrugModel> patientDrugs = [];
  int counter = 0;
  File? image;
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(DrugPickImage());
    }
  }

  void floatingActionButtonPressed() {
    counter++;
    patientDrugs.add(
      DrugModel(),
    );
    emit(FloatingActionButtonPressed());
  }

  void imageTapped() async {
    await pickImage();
    if (counter > 0 && image != null) {
      print("******************");
      patientDrugs[counter - 1].image = image;
      print("+++++++++++++");
      print(patientDrugs[counter - 1].image);
      emit(ImageTapped());
    }
  }

  void resetImage() {
    image = null;
  }
}
