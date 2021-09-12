

void main(List<String> arguments) {
  var list = <int>[1705, 1900, 1601, 2000];
  double age;
  for (var i = 0; i < list.length; i++) {
    age = 0;
    if (list[i]%100 == 0) { 
      age = list[i]/100;
    }
    else {
      age = list[i]/100 + 1;
    }
    print(age.toInt());
  }
}
