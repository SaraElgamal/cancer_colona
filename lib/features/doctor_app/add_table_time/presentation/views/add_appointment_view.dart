import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class AddAppointmentView extends StatefulWidget {
  const AddAppointmentView({super.key});

  @override
  State<AddAppointmentView> createState() => _AddAppointmentViewState();
}

class _AddAppointmentViewState extends State<AddAppointmentView> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> days = [
      {'day': 'Sun', 'date': '1'},
      {'day': 'Mon', 'date': '2'},
      {'day': 'Tue', 'date': '3'},
      {'day': 'Wed', 'date': '4'},
      {'day': 'Thu', 'date': '5'},
      {'day': 'Fri', 'date': '6'},
      {'day': 'Sat', 'date': '7'},
    ];
    List<String> appointmentsTimes = [
      '09:00',
      '09:30',
      '10:00',
      '10:30',
      '11:00',
      '11:30',
      '12:00',
      '12:30',
      '01:00',
      '01:30',
      '02:00',
      '02:30',
      '03:00',
      '03:30',
      '04:00',
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select days",
                style: StyleManager.textStyle20.copyWith(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 85,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => dateContainer(days, index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemCount: 7,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Appointments from : to",
                style: StyleManager.textStyle20.copyWith(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 15,
                  childAspectRatio: 168 / 156,
                ),
                itemCount: appointmentsTimes.length,
                itemBuilder: (BuildContext context, int index) =>
                    timeContainer(appointmentsTimes[index], index),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: DefaultButton(
                    text: "Save",
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<bool> dateSelected = List.generate(7, (index) => false);
  Widget dateContainer(List<Map<String, dynamic>> days, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          dateSelected[index] = !dateSelected[index];
        });
      },
      child: Container(
        width: 57,
        height: 84,
        decoration: ShapeDecoration(
          color: dateSelected[index]
              ? ColorsManager.primary
              : const Color(0xB2D9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              days[index]['date'],
              textAlign: TextAlign.center,
              style: StyleManager.textStyle20.copyWith(
                color: dateSelected[index]
                    ? ColorsManager.white
                    : ColorsManager.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              days[index]['day'],
              textAlign: TextAlign.center,
              style: StyleManager.textStyle14.copyWith(
                color: dateSelected[index]
                    ? ColorsManager.white
                    : ColorsManager.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<bool> timeSelected = List.generate(15, (index) => false);
  Widget timeContainer(String time, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          timeSelected[index] = !timeSelected[index];
        });
      },
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          height: 45,
          width: 150,
          decoration: ShapeDecoration(
            color: timeSelected[index]
                ? ColorsManager.primary
                : ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Center(
            child: Text(
              time,
              style: StyleManager.textStyle14.copyWith(
                color: timeSelected[index]
                    ? ColorsManager.white
                    : ColorsManager.onboardingSkipColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
