import 'package:colona/core/resources_manager/assets_manager.dart';

class Medication {
  final String name;
  final String dose;
  final String time;
  final String image;

  Medication(
      {required this.name,
      required this.dose,
      required this.time,
      required this.image});
}

final List<Medication> medications = [
  Medication(
    name: 'Xeloda,500mg',
    dose: '1 pitl,After Breakfast',
    time: '10:00 AM',
    image: AssetsManager.drug1,
  ),
  Medication(
    name: 'Adrucil,500mg',
    dose: '1 pitl,After dinner',
    time: '05:00 PM',
    image: AssetsManager.drug2,
  ),
  Medication(
    name: 'Erbitux,5mg',
    dose: '1 pitl,After lunch',
    time: '10:00 PM',
    image: AssetsManager.drug3,
  ),
];
