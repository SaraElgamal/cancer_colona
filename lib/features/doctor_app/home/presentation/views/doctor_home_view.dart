import 'package:colona/core/core_widgets/grid_view/default_grid_view.dart';
import 'package:colona/features/doctor_app/add_drugs_view/presentation/views/add_drugs_view.dart';
import 'package:colona/features/doctor_app/add_life_style/presentation/views/add_life_style_view.dart';
import 'package:colona/features/doctor_app/add_table_time/presentation/views/add_appointment_view.dart';
import 'package:colona/features/doctor_app/ai_model/presentation/views/ai_model_view.dart';
import 'package:colona/features/patient_app/home/data/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Function()> funList = [
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AiModelView()));
      },
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddAppointmentView()));
      },
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddDrugsView()));
      },
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddLifeStyleView()));
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              IconlyLight.setting,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
        ).copyWith(
          top: 150,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 20, // Horizontal space between containers
            mainAxisSpacing: 20, // Vertical space between containers
            childAspectRatio: 168 / 156, // Width / Height ratio
          ),
          itemCount: doctorHomeData.length,
          itemBuilder: (BuildContext context, int index) => DefaultGridViewItem(
            onTap: funList[index],
            title: doctorHomeData[index].title,
            image: doctorHomeData[index].image,
            subTitle: doctorHomeData[index].subtitle,
          ),
        ),
      ),
    );
  }
}
