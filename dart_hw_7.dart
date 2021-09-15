import 'dart:core';


void main(List<String> arguments) {
  var cuboid = Cuboid(1, 2, 3);
  var x = cuboid.cuboidVolume;
  num areaSurface = cuboid.surfaceArea;
  print('Cuboid volume = $x');
  print('Cuboid Area Surface = $areaSurface');
  var cube = Cube(2);
  areaSurface = cube.surfaceArea;
  x = cube.cuboidVolume;
  print('Cube Volume = $x');
  print('Cube Surface Area = $areaSurface');
}
class Cuboid  {
  final int lenght;
  final int weight;
  final int height;
  Cuboid(this.weight, this.lenght, this.height);
  int get cuboidVolume {
    final volume = lenght * weight * height;
    return volume;

  }
  
  int get surfaceArea {
    final surface = 2*(lenght*weight + lenght * height + weight * height);
    return surface;
  }

}
class Cube extends Cuboid {
  Cube(int lenght) : super(lenght, lenght, lenght);
}
