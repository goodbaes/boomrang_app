import 'package:boomerang/domain/domain.dart';

class UserModel extends BaseUserModel {
  final String name;
  final String email;
  final DateTime dateOfBirthdate;
  final ImageModel avatar;

  UserModel({
    required String id,
    required String phone,
    required this.name,
    required this.email,
    required this.dateOfBirthdate,
    required this.avatar,
  }) : super(id: id, phone: phone);

  UserModel.empty()
      : name = '',
        email = '',
        dateOfBirthdate = DateTime.now(),
        avatar = ImageModel(id: '', url: ''),
        super(id: '', phone: '');

  UserModel copyWith({
    String? id,
    String? phone,
    String? name,
    String? email,
    DateTime? dateOfBirthdate,
    ImageModel? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      phone: phone ?? this.name,
      name: name ?? this.name,
      email: email ?? this.email,
      dateOfBirthdate: dateOfBirthdate ?? this.dateOfBirthdate,
      avatar: avatar ?? this.avatar,
    );
  }
}
