enum Options{
  rock,
  paper,
  scissor,
}

class CircularButtonOption {
  final String text;
  final Options type;
  bool isSelected;

  set selectOption(bool state) { 
      isSelected = state; 
   } 

  CircularButtonOption({
    required this.text,
    required this.type,
    this.isSelected = false,
  });

}


