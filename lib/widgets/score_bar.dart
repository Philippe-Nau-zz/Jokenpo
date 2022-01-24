import 'package:flutter/material.dart';
import 'package:joken_po/utils/color_pallete.dart';
import 'package:joken_po/widgets/dot_score.dart';

class ScoreBar extends StatelessWidget {
  final int itemCount;
  final String text;
  const ScoreBar({
    this.itemCount = 0,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            color: ColorPallete.kMainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorPallete.kLightShadow,
                offset: Offset(-9, -5),
                blurRadius: 16,
              ),
              BoxShadow(
                color: ColorPallete.kDarkShadow,
                offset: Offset(9, 9),
                blurRadius: 16,
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: ColorPallete.kDarkShadow,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: ColorPallete.kMainColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: ColorPallete.kLightShadow,
                offset: Offset(-9, -5),
                blurRadius: 16,
              ),
              BoxShadow(
                color: ColorPallete.kDarkShadow,
                offset: Offset(9, 5),
                blurRadius: 16,
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => ListScore(itemCount: itemCount),
          ),
        ),
      ],
    );
  }
}

class ListScore extends StatelessWidget {
  final int itemCount;
  const ListScore({
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => DotScore(),
      separatorBuilder: (context, index) => SizedBox(
        width: 5,
      ),
      itemCount: itemCount,
    );
  }
}
