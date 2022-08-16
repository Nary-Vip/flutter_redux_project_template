import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_external_ids.dart';
import 'package:personal_pjt/models/search_track_images.dart';
import 'package:personal_pjt/models/user_follower.dart';

part 'user_profile.g.dart';

abstract class UserProfile implements Built<UserProfile, UserProfileBuilder> {
  factory UserProfile(
      [UserProfileBuilder updates(UserProfileBuilder builder)]) = _$UserProfile;

  UserProfile._();

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'external_urls')
  SearchTrackExternalIds? get externalUrls;
  
  UserFollowers? get followers;
  String? get href;
  String? get id;
  BuiltList<SearchTrackImages>? get images;
  String? get type;
  String? get uri;

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}
