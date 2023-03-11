class BoolUtil {
  static bool toBoolDefaultFalse(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    String valueStr = value.toString();
    return valueStr == 'true' || valueStr == '1' || valueStr.toUpperCase() == 'YES' || valueStr.toUpperCase() == 'Y';
  }
}

extension BoolUtils on double {}
