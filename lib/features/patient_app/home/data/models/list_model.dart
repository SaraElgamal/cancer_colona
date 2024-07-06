import 'package:colona/core/resources_manager/assets_manager.dart';

class DataModel {
  final String title;
  final String image;
  final String subtitle;

  DataModel({
    required this.title,
    required this.image,
    required this.subtitle,
  });
}

List<DataModel> patientHomeData = [
  DataModel(
    title: "Online detection",
    image: AssetsManager.onlineDetection,
    subtitle: "120 patient",
  ),
  DataModel(
    title: "Symptoms",
    image: AssetsManager.symptoms,
    subtitle: "8 symptoms",
  ),
  DataModel(
    title: "Drugs",
    image: AssetsManager.drugs,
    subtitle: "20 type",
  ),
  DataModel(
    title: "Life style",
    image: AssetsManager.lifeStyle,
    subtitle: "10 instructions",
  ),
  DataModel(
    title: "Radiology and\nanalyses",
    image: AssetsManager.xray,
    subtitle: "3 type",
  ),
  DataModel(
    title: "Community",
    image: AssetsManager.community,
    subtitle: "38 People",
  ),
];
List<DataModel> doctorHomeData = [
  DataModel(
    title: "Radiology and analyses",
    image: AssetsManager.xray,
    subtitle: "",
  ),
  DataModel(
    title: "Add\nappointments",
    image: AssetsManager.appointments,
    subtitle: "",
  ),
  DataModel(
    title: "Add Drugs",
    image: AssetsManager.drugs,
    subtitle: "",
  ),
  DataModel(
    title: "Add Life style",
    image: AssetsManager.lifeStyle,
    subtitle: "",
  ),
];
