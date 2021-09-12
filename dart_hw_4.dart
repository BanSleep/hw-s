void main(List<String> arguments) {
  var list = [60, 999, 14, "dart1", 45, 95, "dart", 1];
  bool flag = false;
  dynamic value = "dart";
  for (int i = 0; i < list.length; i++) {
    if (list[i] == value) {
      flag = true;
      print(flag);
    }
    if (flag == true) {
      i = 0;
      value = 15;
      flag = false;
    }
  }
  if (flag == false) {
    print(flag);
  }

}
