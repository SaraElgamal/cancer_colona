import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DoctorPickImage extends StatelessWidget {
  const DoctorPickImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // The profile image
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetsManager.steve),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // The camera icon
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  IconlyLight.camera,
                  color: ColorsManager.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
