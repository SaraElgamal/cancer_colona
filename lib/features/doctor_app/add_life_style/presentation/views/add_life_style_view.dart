import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:colona/core/core_widgets/form_field/default_from.dart';
import 'package:colona/core/localization/translation_key_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class AddLifeStyleView extends StatefulWidget {
  const AddLifeStyleView({super.key});

  @override
  State<AddLifeStyleView> createState() => _AddLifeStyleViewState();
}

List<LifeModel> lifeList = [];

class _AddLifeStyleViewState extends State<AddLifeStyleView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Life Style'),
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
      body: counter == 0
          ? noLifeText()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: counter,
              itemBuilder: (context, index) {
                return LifeItem(
                  index: index,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            lifeList.add(LifeModel());
          });
        },
        backgroundColor: ColorsManager.primary,
        child: const Icon(
          IconlyLight.plus,
          color: ColorsManager.white,
        ),
      ),
    );
  }

  Center noLifeText() {
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
            TypewriterAnimatedText('No Life Style Added Yet'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}

class LifeItem extends StatefulWidget {
  const LifeItem({super.key, required this.index});
  final int index;
  @override
  State<LifeItem> createState() => _LifeItemState();
}

class _LifeItemState extends State<LifeItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: [
          DefaultForm(
            text: "Style Name",
            controller: TextEditingController(),
            hintText: "Style Name",
            textInputType: TextInputType.text,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.title,
                color: ColorsManager.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          DefaultForm(
            text: "Style Description",
            controller: TextEditingController(),
            hintText: "Style Description",
            textInputType: TextInputType.text,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.description_outlined,
                color: ColorsManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LifeModel {
  final String? name;
  final String? description;

  LifeModel({
    this.name,
    this.description,
  });
}
