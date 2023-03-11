class ListUtil {
  static List<T> toListDefaultEmpty<T>(dynamic value) {
    if (value == null) return [];
    if (value is List<T>) return value;
    return [];
  }
}

extension ListUtils on List {}
