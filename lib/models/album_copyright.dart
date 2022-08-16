import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_items.dart';

part 'album_copyright.g.dart';

abstract class AlbumCopyright
    implements Built<AlbumCopyright, AlbumCopyrightBuilder> {
  factory AlbumCopyright(
          [AlbumCopyrightBuilder updates(AlbumCopyrightBuilder builder)]) =
      _$AlbumCopyright;

  AlbumCopyright._();

  String? get addedAt;
  SearchTrackItem? get album;

  static Serializer<AlbumCopyright> get serializer =>
      _$albumCopyrightSerializer;
}
