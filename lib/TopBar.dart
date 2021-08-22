import 'package:flutter/material.dart';

class TopBar extends AppBar {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.0,
      title: Center(
        child: Text(
          'News App',
          style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w700
          ),
          //  textAlign: TextAlign.right,
        ),
      ),
      //backgroundColor: primaryColor,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(75),
              bottomRight: Radius.circular(75)
          )
      ),
    );
  }
}
