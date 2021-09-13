import 'dart:core';


void main(List<String> arguments) {
  var cuboid = Cuboid(1, 2, 3);
  int x = cuboid.cuboidVolume;
  num areaSurface = cuboid.surfaceArea;
  print('Cuboid volume = $x');
  print('Cuboid Area Surface = $areaSurface');
  var cube = Cube(1, 2, 3);
  areaSurface = cube.surfaceArea;
  x = cube.cuboidVolume;
  print('Cube Volume = $x');
  print('Cube Surface Area = $areaSurface');
}
class Cuboid  {
  var lenght;
  var weight;
  var height;
  // late int surface, volume;
  Cuboid(int w, int l, int h) {
    lenght = l;
    height = h;
    weight = w;
  }
  int get cuboidVolume {
    int volume = lenght * weight * height;
    return volume;

  }
  
  num get surfaceArea {
    num surface = 2*(lenght*weight + lenght * height + weight * height);
    return surface;
  }

}
class Cube extends Cuboid {
  @override
  var lenght, height, weight;
  Cube(int weight, int lenght, int height) : super(weight, lenght, height) { 
    this.lenght = lenght;
    this.height = lenght;
    this.weight = lenght;
  }

}