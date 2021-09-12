import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main(List<String> arguments) {
  int counter = 1;
  while (counter < 101) {
    if (counter%3 == 0 && counter%5 != 0) {
      print("Super");
    }
    else if (counter%5 == 0 && counter%3 != 0) {
      print("Quiz");
    }
    else if (counter%3 == 0 && counter%5 == 0) {
      print("Super quiz");
    }
    else print(counter);
    counter++;
  }
}
