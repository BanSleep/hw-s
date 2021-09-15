void main(List<String> args) {
  final list = ["a", "ab", "abc"];
  final x = list.map((e) => e.length);
  int y = 0;
  for (int i in x) {
    y += i;
  }
  print(y);
}