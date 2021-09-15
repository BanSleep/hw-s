void main(List<String> arguments) {
  var list = ["dart", "abc", "good luck"];
  for (int i = 0; i < list.length; i++) {
    int x = calculate(list[i]) * (i + 1);
    print(x);
  }
  
}

int calculate (String word) {
  int x = 0;
  for (int i in word.replaceAll(" ", "").codeUnits) {
    x += i - 'a'.codeUnitAt(0) + 1;
  }
  return x;
}
