import 'package:boomerang/domain/domain.dart';

class UserCompactModel {
  final String id;
  final String name;
  final ImageModel avatar;

  UserCompactModel({
    required this.id,
    required this.name,
    required this.avatar,
  });
}
