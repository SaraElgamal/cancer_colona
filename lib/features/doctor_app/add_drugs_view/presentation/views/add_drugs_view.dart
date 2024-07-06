import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:colona/core/core_widgets/form_field/default_from.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/doctor_app/add_drugs_view/presentation/add_drug_cubit_ui/add_drug_ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class AddDrugsView extends StatefulWidget {
  const AddDrugsView({super.key});
  @override
  State<AddDrugsView> createState() => _AddDrugsViewState();
}

class _AddDrugsViewState extends State<AddDrugsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDrugUiCubit, AddDrugUiState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Drugs'),
            leading: IconButton(
              icon: const Icon(
                IconlyLight.arrowLeft2,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      TranslationKeyManager.save.tr,
                      style: StyleManager.textStyle16.copyWith(
                        fontSize: 18,
                        color: ColorsManager.primary,
                      ),
                    )),
              )
            ],
          ),
          body: AddDrugUiCubit.get(context).counter == 0
              ? noDrugText()
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  itemCount: AddDrugUiCubit.get(context).counter,
                  itemBuilder: (context, index) {
                    return DrugItem(
                      index: index,
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AddDrugUiCubit.get(context).floatingActionButtonPressed();
              AddDrugUiCubit.get(context).resetImage();
            },
            backgroundColor: ColorsManager.primary,
            child: const Icon(
              IconlyLight.plus,
              color: ColorsManager.white,
            ),
          ),
        );
      },
    );
  }

  Center noDrugText() {
    return Center(
      child: DefaultTextStyle(
        style: StyleManager.textStyle20.copyWith(
          color: ColorsManager.black,
          fontWeight: FontWeight.w500,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 1),
          animatedTexts: [
            TypewriterAnimatedText('No Drugs Added Yet'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}

class DrugItem extends StatefulWidget {
  const DrugItem({super.key, required this.index});
  final int index;
  @override
  State<DrugItem> createState() => _DrugItemState();
}

class _DrugItemState extends State<DrugItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: BlocBuilder<AddDrugUiCubit, AddDrugUiState>(
        builder: (context, state) {
          var cubit = AddDrugUiCubit.get(context);
          return Column(
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    cubit.imageTapped();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: cubit.image == null
                        ? const AssetImage(AssetsManager.selectImage)
                        : cubit.patientDrugs.isNotEmpty &&
                                cubit.patientDrugs[widget.index].image != null
                            ? FileImage(cubit.patientDrugs[widget.index].image!)
                            : const AssetImage(AssetsManager.selectImage)
                                as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultForm(
                text: TranslationKeyManager.drugName.tr,
                controller: TextEditingController(),
                hintText: "Drug Name",
                textInputType: TextInputType.text,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.medication,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultForm(
                text: TranslationKeyManager.drugDescription.tr,
                controller: TextEditingController(),
                hintText: "Drug Description",
                textInputType: TextInputType.text,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.description_outlined,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultForm(
                text: TranslationKeyManager.times.tr,
                controller: TextEditingController(),
                hintText: "How many times per day?",
                textInputType: TextInputType.number,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.access_time_sharp,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DrugModel {
  final String? name;
  File? image; // Changed this line
  final String? description;
  final int? timeNum;

  DrugModel({
    this.name,
    this.image,
    this.description,
    this.timeNum,
  });
}
