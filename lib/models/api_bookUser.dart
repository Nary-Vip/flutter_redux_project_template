import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_bookUser.g.dart';

abstract class ApiBookUser implements Built<ApiBookUser, ApiBookUserBuilder> {
  factory ApiBookUser(
      [ApiBookUserBuilder updates(ApiBookUserBuilder builder)]) = _$ApiBookUser;

  ApiBookUser._();

  String? get username;
  String? get password;
  String? get token;

  set username(String? i) => username = i;
  set password(String? i) => password = i;

  static Serializer<ApiBookUser> get serializer => _$apiBookUserSerializer;
}
