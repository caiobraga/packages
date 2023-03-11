class IntUtil {
  static int toIntDefaultZero(dynamic value) {
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }
}

extension IntUtils on int {}
