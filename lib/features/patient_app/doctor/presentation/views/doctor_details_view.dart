import 'package:colona/core/core_widgets/buttons/default_button.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/doctor/data/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0, bottom: 12),
                        child: Text(
                          "Dr.Ahmed ezelregal",
                          style: StyleManager.textStyle15.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "mansoura, hospital",
                          style: StyleManager.textStyle16.copyWith(
                            color: ColorsManager.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: ColorsManager.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "mansoura",
                              style: StyleManager.textStyle16.copyWith(
                                color: ColorsManager.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const ShapeDecoration(
                                color: ColorsManager.secondary,
                                shape: OvalBorder(),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.videocam_outlined,
                                  size: 25,
                                  color: ColorsManager.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const ShapeDecoration(
                                color: ColorsManager.secondary,
                                shape: OvalBorder(),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.chat_outlined,
                                  size: 25,
                                  color: ColorsManager.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(
                      AssetsManager.doctor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                          height: 80,
                          width: 117,
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              )
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  listData[index].title,
                                  style: StyleManager.textStyle14,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      listData[index].icon,
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      listData[index].number,
                                      style: StyleManager.textStyle16.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.black,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 7,
                        ),
                    itemCount: listData.length),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "About",
                  style: StyleManager.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 11),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'My name is Ahmed ezelregal, I graduation from the faculty of medicine  mansoura university ',
                        style: StyleManager.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.formFieldHintColor,
                        ),
                      ),
                      TextSpan(
                        text: 'see more ',
                        style: StyleManager.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Availability',
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.black,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Text(
                    'Sun     10:00am to 12:00pm',
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyle14.copyWith(
                      color: ColorsManager.formFieldHintColor,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: Text(
                    'Tue      12:00pm to 6:00pm',
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyle14.copyWith(
                      color: ColorsManager.formFieldHintColor,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 11),
                  child: Text(
                    'Reviews',
                    textAlign: TextAlign.center,
                    style: StyleManager.textStyle16.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              SizedBox(
                height: 61,
                child: Row(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => const CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(AssetsManager.doctor),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 12,
                            ),
                        itemCount: 4),
                    const SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: ColorsManager.secondary,
                      child: Center(
                        child: Text(
                          "+35",
                          style: StyleManager.textStyle16.copyWith(
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: SizedBox(
                    width: double.infinity,
                    child: DefaultButton(
                        text: "Book appointment", onPressed: () {})),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
