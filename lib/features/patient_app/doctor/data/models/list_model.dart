import 'package:colona/core/resources_manager/assets_manager.dart';

class ListModel {
  final String title;
  final String icon;
  final String number;
  ListModel({required this.title, required this.icon, required this.number});
}

List<ListModel> listData = [
  ListModel(title: "Review", icon: AssetsManager.users, number: "200"),
  ListModel(title: "Experience", icon: AssetsManager.star, number: "4Yrs"),
  ListModel(title: "Rating", icon: AssetsManager.rate, number: "4.0"),
];
