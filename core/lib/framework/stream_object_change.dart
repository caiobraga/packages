enum StreamObjectChangeType { put, remove }

class StreamObjectChange<T> {
  final StreamObjectChangeType changeType;
  final T object;

  StreamObjectChange(this.changeType, this.object);

  factory StreamObjectChange.put(T object) => StreamObjectChange(StreamObjectChangeType.put, object);
  factory StreamObjectChange.remove(T object) => StreamObjectChange(StreamObjectChangeType.remove, object);
}
