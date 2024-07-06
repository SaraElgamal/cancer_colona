import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultGridViewItem extends StatelessWidget {
  const DefaultGridViewItem(
      {super.key,
      required this.title,
      required this.image,
      required this.subTitle,
      required this.onTap});
  final String title;
  final String image;
  final String subTitle;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
          border: Border.all(color: ColorsManager.bottomNavColor, width: .5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                height: 50,
                width: 50,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: StyleManager.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subTitle == ""
                  ? const SizedBox()
                  : Text(
                      subTitle,
                      style: StyleManager.textStyle10,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
