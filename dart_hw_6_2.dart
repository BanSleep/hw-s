void main(List<String> args) {
  final list = [1, -10, 9, -1];
  final x = list.where((element) => element > 0);
  int y = 0;
  for(int i in x) {
    y += i;
  }
  print(y);
}