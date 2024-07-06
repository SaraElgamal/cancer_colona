part of 'add_drug_ui_cubit.dart';

@immutable
sealed class AddDrugUiState {}

final class AddDrugUiInitial extends AddDrugUiState {}

final class DrugPickImage extends AddDrugUiState {}

final class FloatingActionButtonPressed extends AddDrugUiState {}

final class ImageTapped extends AddDrugUiState {}
