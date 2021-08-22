import 'package:flutter/material.dart';

InkWell categoriesItem (String imageUrl /*, Widget goToScreen*/){
  return InkWell(
    onTap: () {
      //the goToScreen will be used here
    },
    child: Container(
      width: 130.0,
      height: 135.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}