class Stack<E> {
  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> elements) : _storage = List.of(elements);
  final List<E> _storage;

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();
  E get peek => _storage.last;
  bool get isEmpty => _storage.isEmpty;
  bool get isNotEmpty => !isEmpty;

  void printInReverse<E>(List<E> list) {
    var stack = Stack<E>();
    for (E value in list) {
      stack.push(value);
    }
    while (stack.isNotEmpty) {
      print(stack.pop());
    }
  }

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}

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
  // final smokeStack = Stack.of(list);
  // print(smokeStack);
  // smokeStack.pop();
  // print(smokeStack);
}
