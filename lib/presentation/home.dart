import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joken_po/controller/home_controller.dart';
import 'package:joken_po/utils/color_pallete.dart';
import 'package:joken_po/widgets/circular_button.dart';
import 'package:joken_po/widgets/score_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: ColorPallete.kMainColor,
        body: SafeArea(
          child: GetBuilder<HomeController>(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScoreBar(
                  text: 'Computer',
                  itemCount: controller.computerScore,
                ),
                CircularButton(
                  marginAll: 50,
                  child: Center(
                    child: Text(
                      controller.randomSelected?.text ?? 'GO!',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: ColorPallete.kDarkShadow,
                      ),
                    ),
                  ),
                  onTap: () => controller.randomSelectOption(),
                ),
                ScoreBar(
                  text: 'Player',
                  itemCount: controller.playerScore,
                ),
                _ButtonsRow(
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  final HomeController controller;
  _ButtonsRow({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: controller.optionsList
            .map(
              (e) => CircularButton(
                width: 70,
                heigth: 70,
                isConcave: e.isSelected,
                onTap: () {
                  if (!controller.isRandomSelecting)
                    controller.selectOption(e.type);
                },
                child: Text(
                  e.text,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
