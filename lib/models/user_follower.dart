import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_follower.g.dart';

abstract class UserFollowers
    implements Built<UserFollowers, UserFollowersBuilder> {
  factory UserFollowers(
          [UserFollowersBuilder updates(UserFollowersBuilder builder)]) =
      _$UserFollowers;

  UserFollowers._();

  int? get total;
  String? get href;

  static Serializer<UserFollowers> get serializer => _$userFollowersSerializer;
}
