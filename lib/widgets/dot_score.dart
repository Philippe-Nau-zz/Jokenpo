import 'package:flutter/material.dart';
import 'package:joken_po/utils/color_pallete.dart';

class DotScore extends StatelessWidget {
  const DotScore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPallete.mainColor,
          boxShadow: [
            BoxShadow(
              color: ColorPallete.lightShadow,
              offset: Offset(-9, -9),
              blurRadius: 16,
            ),
            BoxShadow(
              color: ColorPallete.darkShadow,
              offset: Offset(9, 9),
              blurRadius: 16,
            ),
          ],
        ),
        child: Container(
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPallete.mainColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorPallete.darkShadow,
                  ColorPallete.lightShadow,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
