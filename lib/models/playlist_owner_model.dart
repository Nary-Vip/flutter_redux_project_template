import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';

part 'playlist_owner_model.g.dart';

abstract class PlaylistOwner
    implements Built<PlaylistOwner, PlaylistOwnerBuilder> {
  factory PlaylistOwner(
          [PlaylistOwnerBuilder updates(PlaylistOwnerBuilder builder)]) =
      _$PlaylistOwner;

  PlaylistOwner._();

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'external_urls')
  SearchTrackExternalUrls? get externalUrls;

  String? get href;

  String? get id;

  String? get type;

  String? get uri;

  static Serializer<PlaylistOwner> get serializer => _$playlistOwnerSerializer;
}
