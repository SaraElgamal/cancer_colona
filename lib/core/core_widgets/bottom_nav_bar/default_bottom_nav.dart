import 'package:colona/core/core_widgets/rive/rive_utils.dart';
import 'package:colona/core/resources_manager/color_manager.dart';
import 'package:colona/features/patient_app/home/data/models/menu.dart';
import 'package:colona/features/patient_app/home/presentation/views/widgets/btm_nav_item.dart';
import 'package:flutter/material.dart';

class DefaultBottomNav extends StatelessWidget {
  const DefaultBottomNav(
      {super.key,
      required this.animation,
      required this.updateSelectedBtmNav,
      required this.selectedBottonNav});
  final Animation<double> animation;
  final Function(Menu) updateSelectedBtmNav;
  final Menu selectedBottonNav;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 100 * animation.value),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin:
              const EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: 20),
          decoration: const BoxDecoration(
            //color: const Color(0xFF17203A).withOpacity(0.8),
            color: ColorsManager.bottomNavColor,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavItems.length,
                (index) {
                  Menu navBar = bottomNavItems[index];
                  return BtmNavItem(
                    navBar: navBar,
                    press: () {
                      if (navBar.rive.status != null) {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                      } else {
                        print('Status is null for ${navBar.title}');
                      }
                      updateSelectedBtmNav(navBar);
                    },
                    riveOnInit: (artboard) {
                      navBar.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: navBar.rive.stateMachineName);
                      if (navBar.rive.status == null) {
                        print(
                            'Status is null after initialization for ${navBar.title}');
                      }
                    },
                    selectedNav: selectedBottonNav,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
