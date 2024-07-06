import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool buttonTapped = false;
  int currentIndex = -1;
  List<bool> timeBool = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Appointment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Color(0xFFE0E0E0),
              ),
              TableCalendar(
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2100, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: ColorsManager.primary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: ColorsManager.primary.withOpacity(.4),
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const Divider(
                color: Color(0xFFE0E0E0),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Time',
                textAlign: TextAlign.center,
                style: StyleManager.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.black,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          buttonTapped = true;
                          currentIndex = index;
                        });
                      },
                      child: CheckboxListTile(
                        activeColor: ColorsManager.primary,
                        checkColor: ColorsManager.white,
                        value: timeBool[index],
                        onChanged: (val) {
                          setState(() {
                            timeBool[index] = val!;
                          });
                        },
                        title: Text(
                          '10:00 AM',
                          style: StyleManager.textStyle16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: buttonTapped && currentIndex == index
                                ? ColorsManager.white
                                : ColorsManager.black,
                          ),
                        ),
                      )),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: 3),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: double.infinity,
                child:
                    DefaultButton(text: "Book Appointment", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: buttonTapped && currentIndex == index
                                ? ColorsManager.primary
                                : ColorsManager.white,
                            border: Border.all(
                              color: buttonTapped && currentIndex == index
                                  ? ColorsManager.primary
                                  : ColorsManager.primary,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              '10:00 AM',
                              style: StyleManager.textStyle16.copyWith(
                                fontWeight: FontWeight.w400,
                                color: buttonTapped && currentIndex == index
                                    ? ColorsManager.white
                                    : ColorsManager.black,
                              ),
                            ),
                          ),
                        ),
 */
