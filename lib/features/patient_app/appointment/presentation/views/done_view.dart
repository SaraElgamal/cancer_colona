import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            LottieBuilder.asset(AssetsManager.done2,
                width: 230.0, height: 230.0),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Done successfully",
              style: StyleManager.textStyle32,
            )
          ],
        ),
      ),
    );
  }
}
