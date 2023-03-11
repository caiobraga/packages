import '../core.dart';

abstract class Adapter<T extends Entity> {
  Map<String, dynamic> toJson(T entity);

  T fromJson(Map<String, dynamic> json);
}
