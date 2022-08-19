import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:spotify/models/search_track_album.dart';

part 'library_item.g.dart';

abstract class LibraryItem implements Built<LibraryItem, LibraryItemBuilder> {
  factory LibraryItem(
      [LibraryItemBuilder updates(LibraryItemBuilder builder)]) = _$LibraryItem;

  LibraryItem._();

  @BuiltValueField(wireName: 'added_at')
  String? get addedAt;
  SearchTrackAlbum? get album;

  static Serializer<LibraryItem> get serializer => _$libraryItemSerializer;
}
