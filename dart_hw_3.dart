

void main(List<String> arguments) {
  final list = <int>[1705, 1900, 1601, 2000];
  int age;
  for (int year in list) {
    age = 0;
    if (year%100 == 0) { 
      age = year~/100;
    }
    else {
      age = year~/100 + 1;
    }
    print(age);
  }
}
