void main(List<String> arguments) {
  var list = [
    ["d", "a", "r", "t"],
    ["a", "b", "c"],
    ["g", "o", "o", "d", "l", "u", "c", "k"]
  ];
  completeVoid(list);
}

void completeVoid (List<List<String>> list) {
  List<int> helpList = [];
  int x = 4, l = 0;
  for (var i = 0; i < 3; i++) {
    helpList.add(0);
  }
  for (var i = 0; i < list.length; i++) {
    if (i == 1) {
      x = 3;
    }
    if (i == 2) x = 8;
    for (var j = 0; j < x; j++) {
      helpList[l] += (list[i][j].codeUnitAt(0) - 96);
    }
    
    l++;
    helpList[l - 1] *= l;
    
  }
  for (var i = 0; i < 3; i++) {
    print(helpList[i]);
  }
}