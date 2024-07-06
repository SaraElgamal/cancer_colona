import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/constants_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/drug/data/models/medication.dart';
import 'package:colona/features/patient_app/drug/presentation/views/widgets/circular_menu.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import 'widgets/circular_menu_item.dart';
import 'widgets/medication_card.dart';

class DrugView extends StatelessWidget {
  const DrugView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hey, ahmed'),
          toolbarHeight: 70,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: CircularMenu(
          items: [
            CircularMenuItem(
              icon: Icons.call,
              color: ColorsManager.primary,
              onTap: () {},
            ),
            CircularMenuItem(
              icon: Icons.mail,
              color: ColorsManager.primary,
              onTap: () {},
            ),
            CircularMenuItem(
              icon: Icons.watch_later,
              color: ColorsManager.primary,
              onTap: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                activeColor: ColorsManager.primary,
                dayProps: EasyDayProps(
                  height: 95,
                  width: 57,
                  activeDayStyle: const DayStyle(
                    dayStrStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: ConstantsManager.fontFamily,
                      fontSize: 14,
                    ),
                    dayNumStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: ConstantsManager.fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                    monthStrStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: ConstantsManager.fontFamily,
                    ),
                    borderRadius: 20,
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: ColorsManager.easyTimeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    dayStrStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: ConstantsManager.fontFamily,
                    ),
                    dayNumStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: ConstantsManager.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    monthStrStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: ConstantsManager.fontFamily,
                      fontSize: 14,
                    ),
                    borderRadius: 20,
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: ColorsManager.easyTimeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    dayStrStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: ConstantsManager.fontFamily,
                      fontSize: 14,
                    ),
                    dayNumStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: ConstantsManager.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    monthStrStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: ConstantsManager.fontFamily,
                      fontSize: 14,
                    ),
                    borderRadius: 20,
                  ),
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayHighlightColor: ColorsManager.easyTimeColor,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'To take',
                    style: StyleManager.textStyle16.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Edit',
                    style: StyleManager.textStyle16.copyWith(
                      color: ColorsManager.redColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemCount: medications.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemBuilder: (context, index) {
                return MedicationCard(medication: medications[index]);
              },
            ),
          ],
        )
        /*SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
          circleColors: [
            Colors.white,
            ColorsManager.primary,
            ColorsManager.primary.withOpacity(.3)
          ],
          backgroundColor: Colors.white,
          elevation: 2.0,
          items: [],
          circleItems: [
            SCItem(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
            SCItem(
              icon: const Icon(Icons.mail),
              onPressed: () {},
            ),
            SCItem(
              icon: const Icon(Icons.watch_later),
              onPressed: () {},
            ),
          ],
          bnbHeight: 75,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
                  },
                  activeColor: ColorsManager.primary,
                  dayProps: EasyDayProps(
                    height: 95,
                    width: 57,
                    activeDayStyle: const DayStyle(
                      dayStrStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: ConstantsManager.fontFamily,
                        fontSize: 14,
                      ),
                      dayNumStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: ConstantsManager.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                      monthStrStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: ConstantsManager.fontFamily,
                      ),
                      borderRadius: 20,
                    ),
                    inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: ColorsManager.easyTimeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      dayStrStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: ConstantsManager.fontFamily,
                      ),
                      dayNumStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantsManager.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      monthStrStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantsManager.fontFamily,
                        fontSize: 14,
                      ),
                      borderRadius: 20,
                    ),
                    todayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: ColorsManager.easyTimeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      dayStrStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantsManager.fontFamily,
                        fontSize: 14,
                      ),
                      dayNumStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantsManager.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      monthStrStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantsManager.fontFamily,
                        fontSize: 14,
                      ),
                      borderRadius: 20,
                    ),
                    todayHighlightStyle: TodayHighlightStyle.withBackground,
                    todayHighlightColor: ColorsManager.easyTimeColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'To take',
                      style: StyleManager.textStyle16.copyWith(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Edit',
                      style: StyleManager.textStyle16.copyWith(
                        color: ColorsManager.redColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: medications.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return MedicationCard(medication: medications[index]);
                },
              ),
            ],
          ),
        ),
      ),*/
        );
  }
}
