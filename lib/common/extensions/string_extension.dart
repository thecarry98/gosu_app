extension StringExtension on String? {
  bool get isNullOrEmpty {
    if (this == null) return true;
    return (this!.isEmpty);
  }

  String toCapitalized() {
    return this![0].toUpperCase() + (this?.substring(1).toLowerCase() ?? '');
  }
}
