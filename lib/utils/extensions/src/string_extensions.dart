extension ExtenstionStringNull on String? {
  bool get isNullOrEmpty => this == null ? true : this!.trim().isEmpty;
}
