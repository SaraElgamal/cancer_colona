import 'package:colona/core/core_widgets/bottom_nav_bar/default_bottom_nav.dart';
import 'package:colona/core/resources_manager/assets_manager.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/core/resources_manager/style_manager.dart';
import 'package:colona/features/patient_app/home/data/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  Menu selectedBottonNav = bottomNavItems.first;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> settingsList = [
    {
      "title": "Personal account",
      "icon": AssetsManager.profile,
      "onPress": () {},
    },
    {
      "title": "Security and privacy",
      "icon": AssetsManager.security,
      "onPress": () {},
    },
    {
      "title": "About us",
      "icon": AssetsManager.info,
      "onPress": () {},
    },
    {
      "title": "Log out",
      "icon": AssetsManager.logout,
      "onPress": () {},
    },
  ];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Settings",
                  style: StyleManager.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: ColorsManager.black,
                  )),
            ),
            const SizedBox(height: 30),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => DefaultListTile(
                press: settingsList[index]["onPress"],
                title: settingsList[index]["title"],
                icon: settingsList[index]["icon"],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemCount: settingsList.length,
            )
          ],
        ),
      ),
      bottomNavigationBar: DefaultBottomNav(
        animation: animation,
        updateSelectedBtmNav: updateSelectedBtmNav,
        selectedBottonNav: selectedBottonNav,
      ),
    );
  }
}

class DefaultListTile extends StatelessWidget {
  const DefaultListTile({
    super.key,
    required this.press,
    required this.title,
    required this.icon,
  });
  final Function() press;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: CircleAvatar(
        radius: 21,
        backgroundColor: ColorsManager.primary,
        child: SvgPicture.asset(
          height: 20,
          width: 20,
          icon,
          color: ColorsManager.white,
        ),
      ),
      title: Text(
        title,
        style: StyleManager.textStyle16.copyWith(
          color: ColorsManager.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: ColorsManager.black,
      ),
    );
  }
}
