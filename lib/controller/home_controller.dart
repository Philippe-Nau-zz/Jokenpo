import 'dart:math';

import 'package:get/get.dart';
import 'package:joken_po/model/button_option_model.dart';

class HomeController extends GetxController {
  CircularButtonOption rock =
      CircularButtonOption(text: '✊', type: Options.rock);
  CircularButtonOption paper =
      CircularButtonOption(text: '🖐️', type: Options.paper);
  CircularButtonOption scissor =
      CircularButtonOption(text: '✌️', type: Options.scissor);
  List<CircularButtonOption> optionsList = [];
  double _timer = 50;
  final _random = Random();
  CircularButtonOption? randomSelected;
  bool isRandomSelecting = false;

  int playerScore = 0;
  int computerScore = 0;

  @override
  void onInit() {
    super.onInit();
    fetchOptionsList();
  }

  fetchOptionsList() {
    optionsList = [
      rock,
      paper,
      scissor,
    ];
    update();
  }

  Future<void> randomSelectOption() async {
    isRandomSelecting = !isRandomSelecting;
    _timer = 50;
    while (_timer > 0) {
      await Future.delayed(Duration(milliseconds: 150));
      _timer--;
      final _index = _random.nextInt(optionsList.length);
      switch (_index) {
        case 0:
          randomSelected = rock;
          break;
        case 1:
          randomSelected = paper;
          break;
        case 2:
          randomSelected = scissor;
          break;
      }
      update();
    }
    await Future.delayed(Duration(seconds: 2));
    update();
    selectWinner();
    unselectOptions();
  }

  selectWinner() {
    for (final option in optionsList) {
      if (option.isSelected) {
        switch (option.type) {
          case Options.rock:
            {
              if (randomSelected?.type == Options.scissor)
                playerScore++;
              else if(randomSelected?.type == Options.paper)
                computerScore++;
            }
            break;
          case Options.paper:
            {
              if (randomSelected?.type == Options.rock)
                playerScore++;
              else if(randomSelected?.type == Options.scissor)
                computerScore++;
            }
            break;
          case Options.scissor:
            {
              if (randomSelected?.type == Options.paper)
                playerScore++;
              else if(randomSelected?.type == Options.rock)
                computerScore++;
            }
            break;
        }
      }
    }
    update();
  }

  selectOption(Options type) {
    switch (type) {
      case Options.rock:
        {
          rock.selectOption = !rock.isSelected;
          paper.selectOption = false;
          scissor.selectOption = false;
        }
        break;
      case Options.paper:
        {
          paper.selectOption = !paper.isSelected;
          rock.selectOption = false;
          scissor.selectOption = false;
        }
        break;
      case Options.scissor:
        {
          scissor.selectOption = !scissor.isSelected;
          rock.selectOption = false;
          paper.selectOption = false;
        }
        break;
    }
    fetchOptionsList();
  }

  unselectOptions() {
    paper.selectOption = false;
    rock.selectOption = false;
    scissor.selectOption = false;
    isRandomSelecting = false;
    randomSelected = null;
    update();
  }
}
