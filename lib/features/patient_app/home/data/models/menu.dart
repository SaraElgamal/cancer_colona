import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> bottomNavItems = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/home.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "User",
    rive: RiveModel(
        src: "assets/RiveAssets/user.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
  ),
  Menu(
    title: "Settings",
    rive: RiveModel(
        src: "assets/RiveAssets/settings.riv",
        artboard: "SETTINGS",
        stateMachineName: "SETTINGS_Interactivity"),
  ),
  Menu(
    title: "Dots",
    rive: RiveModel(
        src: "assets/RiveAssets/dots.riv",
        artboard: "DOTS",
        stateMachineName: "DOTS_Interactivity"),
  ),
];
