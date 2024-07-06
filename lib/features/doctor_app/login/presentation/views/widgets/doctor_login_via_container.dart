import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class DoctorLoginViaContainer extends StatelessWidget {
  const DoctorLoginViaContainer(
      {super.key, required this.image, required this.title, this.onTap});
  final String image;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsManager.primary,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: StyleManager.textStyle16.copyWith(
                  color: ColorsManager.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
