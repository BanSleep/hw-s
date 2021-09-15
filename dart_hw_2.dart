import 'dart:io';


void main() {
  List<int> list = [2, 555, 236455];
  int counter;
  for (int number in list) {
    counter = 0;
    do {
      number ~/= 10;
      counter++;
    } while (number > 0);
    print(counter);
  }
}

