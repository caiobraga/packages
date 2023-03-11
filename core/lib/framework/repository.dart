import 'dart:async';

import '../core.dart';

abstract class Repository<T extends Entity> {
  Future<T?> get(String id);

  Future<bool> put(T entity);

  Future<bool> remove(T entity);

  Stream<StreamObjectChange<T>> get stream;
}

class MemoryRepository<T extends Entity> extends Repository<T> {
  final Map<String, T> cache = {};

  MemoryRepository() {
    stream.listen(onStreamObjectChange);
  }

  onStreamObjectChange(StreamObjectChange<T> streamObjectChange) {
    if (streamObjectChange.changeType == StreamObjectChangeType.put) {
      cache[streamObjectChange.object.id] = streamObjectChange.object;
    } else if (streamObjectChange.changeType == StreamObjectChangeType.remove) {
      cache.remove(streamObjectChange.object.id);
    }
  }

  dispose() {
    _streamControllerOnChange.close();
  }

  @override
  Future<T?> get(String id) async {
    return cache[id];
  }

  @override
  Future<bool> put(T entity) async {
    _streamControllerOnChange.sink.add(StreamObjectChange.put(entity));
    return true;
  }

  @override
  Future<bool> remove(T entity) async {
    _streamControllerOnChange.sink.add(StreamObjectChange.remove(entity));
    return true;
  }

  final StreamController<StreamObjectChange<T>> _streamControllerOnChange = StreamController();

  @override
  Stream<StreamObjectChange<T>> get stream => _streamControllerOnChange.stream;
}
