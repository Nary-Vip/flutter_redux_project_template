import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'playlist_track.g.dart';

abstract class PlaylistTrack
    implements Built<PlaylistTrack, PlaylistTrackBuilder> {
  factory PlaylistTrack(
          [PlaylistTrackBuilder updates(PlaylistTrackBuilder builder)]) =
      _$PlaylistTrack;

  PlaylistTrack._();

  String? get href;

  int? get total;

  static Serializer<PlaylistTrack> get serializer => _$playlistTrackSerializer;
}
