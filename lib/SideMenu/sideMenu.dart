import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'SideMenuItem.dart';

class sideMenu extends Drawer {

  Function onSideMenuItemClick;
  sideMenu(this.onSideMenuItemClick);

  @override
  Widget build(BuildContext context) {

    List<SideMenuItem> sideMenuList = [
      SideMenuItem(SideMenuItem.CATEGORIES, AppLocalizations.of(context)!.categories, "assets/icons/list.png"),
      SideMenuItem(SideMenuItem.SETTINGS, AppLocalizations.of(context)!.settings, "assets/icons/settings.png"),
    ];

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 95,
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.appTitle,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SideMenuWidget(sideMenuList[index],onSideMenuItemClick);
              },
              itemCount: sideMenuList.length,
            ),
          )
        ),
      ),
    );
  }


}