class PageModel<T> {
  final bool isHaveNext;
  final List<T> results;

  PageModel({
    required this.isHaveNext,
    required this.results,
  });
}
