import 'package:flutter/material.dart';
import 'package:georgiaonmydime/widgets/screens/happyhour/AddHappyHourScreen.dart';
import 'package:georgiaonmydime/widgets/screens/settings/AboutScreen.dart';
import 'package:georgiaonmydime/widgets/screens/settings/SettingsScreen.dart';

class MenuAction extends StatelessWidget {
  const MenuAction({Key key}) : super(key: key);

  void selectMenuOption(BuildContext context, MenuOption menuOption) {
    switch (menuOption.key) {
      case 0:
        openAboutScreen(context);
        break;
      case 1:
        openAddHappyHourScreen(context);
        break;
      case 2:
        openSettingsScreen(context);
        break;
    }
  }

  void openAddHappyHourScreen(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AddHappyHourScreen());
  }

  void openAboutScreen(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => AboutScreen()));
  }

  void openSettingsScreen(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  Icon getIcon(TargetPlatform platform) {
    assert(platform != null);
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return const Icon(Icons.more_vert, color: Colors.white);
      case TargetPlatform.iOS:
        return const Icon(Icons.more_horiz, color: Colors.white);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<MenuOption>(
      onSelected: (menuOption) => selectMenuOption(context, menuOption),
      icon: getIcon(Theme.of(context).platform),
      itemBuilder: (BuildContext context) {
        return choices.map((MenuOption choice) {
          return new PopupMenuItem<MenuOption>(
            value: choice,
            child: new Text(choice.title),
          );
        }).toList();
      },
    );
  }
}

const List<MenuOption> choices = const <MenuOption>[
  const MenuOption(title: 'About Georgia On My Dime', key: 0),
  const MenuOption(title: 'Add a Happy Hour', key: 1),
  const MenuOption(title: 'Settings', key: 2),
];

class MenuOption {
  const MenuOption({this.title, this.key});

  final String title;
  final int key;
}
