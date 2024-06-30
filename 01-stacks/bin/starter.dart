
import 'package:starter/stack.dart';

void main(List<String> args) {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);

  final element = stack.pop();
  print('Popped: $element');

  const list = ['S', 'M', 'O', 'K', 'E'];
  printListReversed(List list1) {
    print(list1.reversed);
  }

  printListReversed(list);
}
