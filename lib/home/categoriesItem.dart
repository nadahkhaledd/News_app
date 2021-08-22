import 'package:flutter/material.dart';

InkWell categoriesItem (String imageUrl /*, Widget goToScreen*/){
  return InkWell(
    onTap: () {
      //the goToScreen will be used here
    },
    child: Container(
      width: 170.0,
      height: 160.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}