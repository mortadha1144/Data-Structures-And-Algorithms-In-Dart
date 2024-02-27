import '../lib/linked_list.dart';

void main(List<String> arguments) {
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print('Original list: $list');
  print("Printing in reverse:");
  printListInReverse(list);
}

void printNodeRecursively<T>(Node<T>? node) {
  if (node == null) return;
  printNodeRecursively(node.next);
  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodeRecursively(list.head);
}
