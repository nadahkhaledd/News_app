import 'package:flutter/material.dart';
import '../tools/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenuItem {
  static const CATEGORIES = 'Cats';
  static const SETTINGS = 'settings';
  String id;
  String title;
  String  iconPath;

  SideMenuItem(this.id, this.title, this.iconPath);
}

class SideMenuWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;
  Function onSideMenuItemClick;
  SideMenuWidget(this.sideMenuItem,this.onSideMenuItemClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSideMenuItemClick(sideMenuItem);

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(sideMenuItem.iconPath),
            ),
            Text(
              sideMenuItem.title,
              style: TextStyle(
                  color: myThemeData.TextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}