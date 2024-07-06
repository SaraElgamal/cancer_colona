import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/drug/data/models/medication.dart';
import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;

  const MedicationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorsManager.easyTimeColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(
              medication.image,
              width: 89,
              height: 78,
            ),
            const SizedBox(width: 25),
            Column(
              children: [
                Text(
                  medication.dose,
                  style: StyleManager.textStyle13,
                ),
                const SizedBox(height: 10),
                Text(
                  medication.name,
                  style: StyleManager.textStyle14,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later,
                      size: 15,
                      color: ColorsManager.black,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      medication.time,
                      style: StyleManager.textStyle13,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
