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
          color: ColorPallete.kMainColor,
          boxShadow: [
            BoxShadow(
              color: ColorPallete.kLightShadow,
              offset: Offset(-9, -9),
              blurRadius: 16,
            ),
            BoxShadow(
              color: ColorPallete.kDarkShadow,
              offset: Offset(9, 9),
              blurRadius: 16,
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPallete.kMainColor,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorPallete.kDarkShadow,
                ColorPallete.kLightShadow,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
