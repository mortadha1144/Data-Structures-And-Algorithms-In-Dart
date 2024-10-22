class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  Node<E>? findMiddle() {
    var slow = head;
    var fast = head;

    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }

    return slow;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  final LinkedList<E> _list;

  _LinkedListIterator(this._list);

  Node<E>? _currentNode;

  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}

void printNodeRecursively<T>(Node<T>? node) {
  if (node == null) return;
  printNodeRecursively(node.next);
  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodeRecursively(list.head);
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;
  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }
  return slow;
}

extension ReversibleLinkedList<E> on LinkedList<E> {
  // void reverse() {
  //   final tempList = LinkedList<E>();
  //   for (var element in this) {
  //     tempList.push(element);
  //   }
  //   head = tempList.head;
  // }

  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;
    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    head = previous;
  }

  void removeAll(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    var previous = head;
    var current = head?.next;
    while (current != null) {
      if (current.value == value) {
        previous?.next == current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
      tail = previous;
    }
  }
}
