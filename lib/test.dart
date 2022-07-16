import 'dart:math';

void main() {
  var list = ['a', 'b', 'c', 'd', 'e'];

  var element = list[Random().nextInt(list.length)];

  print(element);
}
