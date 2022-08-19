import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/library_item.dart';
import 'package:personal_pjt/models/search_track_items.dart';

part 'library_album_result.g.dart';

abstract class LibraryAlbumResult
    implements Built<LibraryAlbumResult, LibraryAlbumResultBuilder> {
  factory LibraryAlbumResult(
      [LibraryAlbumResultBuilder updates(
          LibraryAlbumResultBuilder builder)]) = _$LibraryAlbumResult;

  LibraryAlbumResult._();

  String? get href;
  BuiltList<LibraryItem>? get items;
  int? get limit;
  String? get next;
  int? get offset;
  String? get previous;
  int? get total;

  static Serializer<LibraryAlbumResult> get serializer =>
      _$libraryAlbumResultSerializer;
}
