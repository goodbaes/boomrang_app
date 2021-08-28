import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';
export 'package:boomerang/utils/extensions/extensions.dart';

class PageMapper {
  PageModel<T> map<T, R>(PageDTO dto, T Function(R) mapElement) {
    return PageModel<T>(
      isHaveNext: !dto.next.isNullOrEmpty,
      results: dto.results
          .map<T?>((e) {
            try {
              return mapElement(e);
            } catch (_) {
              return null;
            }
          })
          .where((e) => e != null)
          .toList()
          .cast<T>(),
    );
  }
}
