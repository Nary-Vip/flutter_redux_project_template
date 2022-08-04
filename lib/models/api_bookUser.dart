import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_bookUser.g.dart';

abstract class User implements Built<User, UserBuilder> {
  factory User([UserBuilder updates(UserBuilder builder)]) = _$User;

  User._();

  String? get username;
  String? get password;
  String? get token;

  static Serializer<User> get serializer => _$userSerializer;
}
