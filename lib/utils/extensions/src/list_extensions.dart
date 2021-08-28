extension ExtensionList<T> on List<T> {
  T? firstOrNull() => this.isEmpty ? null : this.first;

  T firstOrElse(T orElse) => this.isEmpty ? orElse : this.first;

  T? lastOrNull() => this.isEmpty ? null : this.last;

  T lastOrElse(T orElse) => this.isEmpty ? orElse : this.last;
}

extension ExtensionNullList<T> on List<T>? {
  bool get isNullOrEmpty => this == null ? true : this!.isEmpty;

  T? firstOrNull() => (this?.isEmpty ?? true) ? null : this!.first;

  T firstOrElse(T orElse) => (this?.isEmpty ?? true) ? orElse : this!.first;

  T? lastOrNull() => (this?.isEmpty ?? true) ? null : this!.last;

  T lastOrElse(T orElse) => (this?.isEmpty ?? true) ? orElse : this!.last;
}
