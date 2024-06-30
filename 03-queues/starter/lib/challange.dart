// Challenge 4: Double-Ended Queue
// A doubled-ended queue — a.k.a. deque — is, as its name suggests, a queue where
// elements can be added or removed from the front or back.
// • A queue (FIFO order) allows you to add elements to the back and remove from the
// front.
// • A stack (LIFO order) allows you to add elements to the back, and remove from the
// back.
// Deque can be considered both a queue and a stack at the same time.

enum Direction {
  front,
  back,
}

abstract class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

class DequeList<E> implements Deque<E> {
  final _list = <E>[];
  @override
  E? dequeue(Direction from) {
    return _list.isEmpty
        ? null
        : switch (from) {
            Direction.front => _list.removeAt(0),
            Direction.back => _list.removeLast()
          };
  }

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case Direction.front:
        _list.insert(0, element);
      case Direction.back:
        _list.add(element);
    }
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) {
    return _list.isEmpty
        ? null
        : switch (from) {
            Direction.front => _list.first,
            Direction.back => _list.last,
          };
  }
}
