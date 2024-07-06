import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      required this.formKey,
      required this.mediaQuery,
      required this.theme});
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final Size mediaQuery;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.width,
      height: mediaQuery.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add A New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: titleController,
              maxLength: 5,
              maxLines: 1,
              hintText: "Enter your task title",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must enter the task title";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: descriptionController,
              hintText: "Enter your task description",
              maxLength: 150,
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must enter the task description";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            Text(
              "select time ",
              textAlign: TextAlign.start,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              "21/6/2024 ",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
                ;
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                "Add Task",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
