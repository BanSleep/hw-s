import 'dart:io';


void main() {
  List<double> list = [2, 555, 236455];
  int counter;
  for (int i = 0; i < list.length; i++) {
    counter = 0;
    do {
      list[i] /= 10;
      counter++;
    } while (list[i] > 1);
    print(counter);
  }
}

