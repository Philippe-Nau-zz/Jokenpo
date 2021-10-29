import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:joken_po/controller/home_controller.dart';
import 'package:joken_po/utils/color_pallete.dart';
import 'package:joken_po/widgets/circular_button.dart';
import 'package:joken_po/widgets/score_bar.dart';

class Home extends StatelessWidget {
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.mainColor,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreBar(text: 'Computer', itemCount: _controller.computerScore,),
              CircularButton(
                marginAll: 50,
                child: Center(
                  child: Text(
                    _controller.randomSelected?.text ?? 'GO!',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.darkShadow,
                    ),
                  ),
                ),
                onTap: () => _controller.randomSelectOption(),
              ),
              ScoreBar(text: 'Player', itemCount: _controller.playerScore,),
              _ButtonsRow(
                controller: _controller,
              ),
            ],
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
