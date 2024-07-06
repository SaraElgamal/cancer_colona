import 'package:colona/core/core_widgets/bottom_nav_bar/default_bottom_nav.dart';
import 'package:colona/core/core_widgets/grid_view/default_grid_view.dart';
import 'package:colona/features/patient_app/home/data/models/list_model.dart';
import 'package:colona/features/patient_app/home/data/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
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

  @override
  Widget build(BuildContext context) {
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
              IconlyLight.notification,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(
          top: 70,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 12, // Horizontal space between containers
            mainAxisSpacing: 16, // Vertical space between containers
            childAspectRatio: 168 / 156, // Width / Height ratio
          ),
          itemCount: patientHomeData.length,
          itemBuilder: (BuildContext context, int index) => DefaultGridViewItem(
            onTap: () {},
            title: patientHomeData[index].title,
            image: patientHomeData[index].image,
            subTitle: patientHomeData[index].subtitle,
          ),
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
