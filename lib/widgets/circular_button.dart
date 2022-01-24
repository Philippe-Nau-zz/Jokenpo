import 'package:flutter/material.dart';
import 'package:joken_po/utils/color_pallete.dart';

class CircularButton extends StatelessWidget {
  final double marginAll;
  final double? width;
  final double? heigth;
  final Widget? child;
  final bool isConcave;
  final VoidCallback? onTap;
  const CircularButton({
    this.child,
    this.width,
    this.heigth,
    this.marginAll = 0,
    this.onTap,
    this.isConcave = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginAll),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: InkWell(
        borderRadius: BorderRadius.circular(125),
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: heigth,
              constraints: BoxConstraints(
                maxHeight: 250,
                maxWidth: 250,
              ),
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
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: isConcave ? 1 : 0,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: width,
                  height: heigth,
                  constraints: BoxConstraints(
                    maxHeight: 250,
                    maxWidth: 250,
                  ),
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
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
