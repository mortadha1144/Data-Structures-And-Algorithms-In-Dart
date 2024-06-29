import 'package:starter/queue.dart';

void main() {
  final queue = QueueStack<String>();
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue); // [Ray, Brian, Eric]
  queue.dequeue();
  print(queue); // [Brian, Eric]
  queue.peek;
  print(queue); // [Brian, Eric]
}
