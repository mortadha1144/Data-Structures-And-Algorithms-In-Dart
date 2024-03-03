import 'package:starter/linked_list.dart';

void main(List<String> arguments) {
  final list = LinkedList<int>();
  list.push(5);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);
  // print('Before reverse : $list');
  final mid = getMiddle(list);
  print('mid : ${mid?.value}');
}
